# Bandit Level 5 → Level 6

## Level Goal

The password for the next level is stored in a file somewhere under the **inhere** directory and has all of the following properties:

- human-readable
- 1033 bytes in size
- not executable

## Initial Observation

Using `ls`, I found the `inhere` directory in the home directory and entered it. It contained multiple directories named `maybehere00` through `maybehere19`.

## Finding the Password File

I used the `find` command with the given file properties:

```bash
find . -type f -size 1033c ! -executable
```

This identified the file:

```text
./maybehere07/.file2
```

The file matched the required size and non-executable criteria.

## Finding the Password

I read the file using:

```bash
cat ./maybehere07/.file2
```

The password found was:

```text
pXa26xhMWaC2SvDotA4r9EgZkulOeSBW
```

## Password

```text
pXa26xhMWaC2SvDotA4r9EgZkulOeSBW
```
