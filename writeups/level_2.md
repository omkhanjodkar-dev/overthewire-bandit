# Bandit Level 2 → Level 3

## Level Goal

The password for the next level is stored in a file called **`--spaces in this filename--`** located in the home directory.

## Initial Observation

Using `ls`, I found a file named `--spaces in this filename--` in the home directory.

## Finding the Password

Because the filename contains spaces and begins with hyphens, I accessed it using a relative path with the filename escaped:

```bash
cat ./--spaces\ in\ this\ filename--
```

The password found was:

```text
7ZZ2LFrykP2zEyvBl4m3clcL7tGYJPME
```

## Password

```text
7ZZ2LFrykP2zEyvBl4m3clcL7tGYJPME
```
