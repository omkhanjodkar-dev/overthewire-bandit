# Bandit Level 4 → Level 5

## Level Goal

The password for the next level is stored in the only human-readable file in the **inhere** directory.

## Initial Observation

Using `ls`, I found the `inhere` directory in the home directory and entered it. The directory contained ten files:

```text
-file00  -file01  -file02  -file03  -file04
-file05  -file06  -file07  -file08  -file09
```

## Identifying the Human-Readable File

I used the `file` command on all the files to determine their file types:

```bash
file ./*
```

Most files were identified simply as `data`. However, `-file07` was identified as `ASCII text`.

This indicated that `-file07` was the human-readable file.

## Finding the Password

I read the contents of `-file07` using:

```bash
cat ./-file07
```

The password found was:

```text
6C7h9GD8M6ai5nr7wo1RonrzFjj9yIrG
```

## Password

```text
6C7h9GD8M6ai5nr7wo1RonrzFjj9yIrG
```
