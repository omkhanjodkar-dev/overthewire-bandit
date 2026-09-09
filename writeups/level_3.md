# Bandit Level 3 → Level 4

## Level Goal

The password for the next level is stored in a hidden file in the **inhere** directory.

## Initial Observation

Using `ls`, I found the `inhere` directory in the home directory and entered it.

```bash
cd inhere
```

A normal `ls` command did not show any files.

## Finding the Hidden File

I used `ls -a` to display hidden files and found:

```text
...Hiding-From-You
```

I then read the file using:

```bash
cat ./...Hiding-From-You
```

The password found was:

```text
xzTXq1rDJQVVAzdv5cHq1TQytTWufAMq
```

## Password

```text
xzTXq1rDJQVVAzdv5cHq1TQytTWufAMq
```
