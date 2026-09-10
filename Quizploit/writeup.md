# CTF Writeup: Quizploit

**Platform:** picoCTF
**Category:** Binary Exploitation
**Difficulty:** Easy

## Overview
**Quizploit** is an introductory Binary Exploitation challenge that tests basic knowledge of ELF (Executable and Linkable Format) binaries, standard C vulnerabilities, and common memory protections. Instead of writing an exploit script, the challenge presents an interactive netcat session (`nc lonely-island.picoctf.net 57244`) with a 13-question quiz about a provided binary and its source code. 

## Source Code Analysis
We are provided with a simple C program (`vuln.c`) that contains a classic buffer overflow vulnerability. 

Looking at the source code:
*   There is a `win()` function that executes `system("cat flag.txt")` but is never called.
*   The `vuln()` function allocates a small character buffer of `0x15` (21) bytes. 
*   It then uses the `fgets()` function to read up to `0x90` (144) bytes from standard input (`stdin`) into that tiny buffer.
*   The `main()` function simply calls `vuln()` and exits.

## Quiz Breakdown & Solutions

Here is the step-by-step breakdown of the answers required to pass the quiz:

**Question 0x1: Is this a '32-bit' or '64-bit' ELF?**
> **Answer:** `64-bit`
*   **Why:** You can determine this by running the `file` command on the binary. Alternatively, examining the binary's strings reveals references to the 64-bit dynamic linker (`/lib64/ld-linux-x86-64.so.2`).

**Question 0x2: What's the linking of the binary? (e.g. static, dynamic)**
> **Answer:** `dynamic`
*   **Why:** The binary relies on external standard C libraries at runtime rather than having them compiled directly into the file. We can see it dynamically linking to `libc.so.6` to import standard functions like `fgets` and `system`.

**Question 0x3: Is the binary 'stripped' or 'not stripped'?**
> **Answer:** `not stripped`
*   **Why:** The binary still contains its debugging information and symbol tables (like `.symtab` and `.strtab`). Function names like `vuln` and `main` are clearly visible.

**Question 0x4: Looking at the vuln() function, what is the size of the buffer in bytes?**
> **Answer:** `0x15`
*   **Why:** The source code explicitly declares the buffer array as `char buffer[0x15] = {0};`.

**Question 0x5: How many bytes are read into the buffer?**
> **Answer:** `0x90`
*   **Why:** The `fgets` function is hardcoded to read up to `0x90` bytes from user input.

**Question 0x6: Is there a buffer overflow vulnerability?**
> **Answer:** `yes`
*   **Why:** The program attempts to stuff 144 bytes (`0x90`) into a 21-byte (`0x15`) container, which will overflow into adjacent stack memory.

**Question 0x7: Name a standard C function that could cause a buffer overflow in the provided C code.**
> **Answer:** `fgets`
*   **Why:** While `fgets` is generally safer than `gets`, it is misused here by allowing more bytes to be read than the buffer can hold.

**Question 0x8: What is the name of function which is not called any where in the program?**
> **Answer:** `win`
*   **Why:** The `win()` function contains the payload to print the flag, but neither `main()` nor `vuln()` invoke it. This is a classic "ret2win" scenario.

**Question 0x9: What type of attack could exploit this vulnerability?**
> **Answer:** `buffer overflow`
*   **Why:** Overwriting the boundaries of a buffer on the stack to control the instruction pointer is the definition of a stack-based buffer overflow.

**Question 0xa: How many bytes of overflow are possible?**
> **Answer:** `0x7b`
*   **Why:** We subtract the buffer size from the read limit. `0x90` (144) - `0x15` (21) = `123` bytes. `123` in hexadecimal is `0x7b`.

**Question 0xb: What protection is enabled in this binary?**
> **Answer:** `NX`
*   **Why:** NX (No-eXecute) ensures that areas of memory like the stack cannot be executed as code. Running `checksec` on the binary would highlight this. 

**Question 0xc: What exploitation technique could bypass NX?**
> **Answer:** `ROP`
*   **Why:** Return-Oriented Programming (ROP) bypasses the NX bit by chaining together existing, executable pieces of code (gadgets) already present in the binary rather than trying to execute newly injected shellcode on the stack.

**Question 0xd: What is the address of 'win()' in hex?**
> **Answer:** `0x401176`
*   **Why:** Found by using tools like `objdump -d vuln`, `readelf`, or `gdb` to inspect the symbol table and locate the memory address of the `win` function.

## Conclusion & Flag
By demonstrating a solid understanding of how to analyze a basic binary and identify a buffer overflow, we successfully pass the quiz. 

**Flag:** `picoCTF{my_bIn@4y_3xpl0it_fL@g_58c7b379}`