# Bandit Level 10 → Level 11

## Level Goal

The password for the next level is stored in the file **data.txt**, which contains base64 encoded data.

## Initial Observation

Using `ls`, I found the file `data.txt` in the home directory.

## Finding the Password

Since the contents of `data.txt` were Base64 encoded, I decoded the file using:

```bash
base64 -d data.txt
```

The decoded output revealed the password:

```text
pYfOY6HwUsDj5rL9UvyhU7MCmv8vN5Ro
```

## Password

```text
pYfOY6HwUsDj5rL9UvyhU7MCmv8vN5Ro
```
