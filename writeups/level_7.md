# Bandit Level 7 → Level 8

## Level Goal

The password for the next level is stored in the file `data.txt` next to the word `millionth`.

## Finding the Password

Using `ls`, I found the file `data.txt` in the home directory.

I searched the file for the word `millionth` using:

```bash
grep "millionth" data.txt
```

The matching line contained the password:

```text
millionth    VR1ljMayciFxbnUokuQmJFw6QC9VKtub
```

## Password

```text
VR1ljMayciFxbnUokuQmJFw6QC9VKtub
```
