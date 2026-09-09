# Bandit Level 1 → Level 2

## Level Goal

The password for the next level is stored in a file called **-** located in the home directory.

## Observation

Using the command `ls`, I found a file called `-` in the home directory.

## Finding the Password

Using the command:

```bash
cat ./-
```

I read the contents of the file and found the password:

```text
PK8fYLZg2hnHSz83plBL1iEPKdD3QToB
```

## Password

```text
PK8fYLZg2hnHSz83plBL1iEPKdD3QToB
```
