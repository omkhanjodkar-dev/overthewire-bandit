# Bandit Level 8 → Level 9

## Level Goal

The password for the next level is stored in the file `data.txt` and is the only line of text that occurs only once.

## Finding the Password

Using `ls`, I found the file `data.txt` in the home directory.

I sorted the contents and searched for the line that occurs only once using:

```bash
sort data.txt | uniq -u
```

This returned:

```text
EjmOSvuAu7sGAHqHVcBDPirRe9T03kxl
```

## Password

```text
EjmOSvuAu7sGAHqHVcBDPirRe9T03kxl
```
