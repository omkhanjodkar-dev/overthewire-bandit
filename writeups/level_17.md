# Bandit Level 17 → Level 18

## Level Goal

There are 2 files in the home directory: `passwords.old` and `passwords.new`. The password for the next level is in `passwords.new` and is the only line that has been changed between the two files. citeturn878667search0

## Finding the Changed Line

I compared the two files using:

```bash
diff password.old password.new
```

The output showed the changed line, which contained the password for the next level.

## Password

```text
OQxXZjELndr90zuhOTDYBEomIØSZITXI
```
