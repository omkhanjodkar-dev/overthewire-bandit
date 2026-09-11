# Bandit Level 18 → Level 19

## Level Goal

The password for the next level is stored in a file called `readme` in the home directory. Unfortunately, someone has modified `.bashrc` to log you out when you log in with SSH. citeturn878667search3

## Finding the Password

Because the normal interactive SSH login immediately logged out, I executed the command remotely as part of the SSH command itself:

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 'cat readme'
```

This directly printed the contents of `readme` without requiring an interactive shell.

## Password

```text
KpsOfPkcP7i1FLIExk2QEjyt6dw8dxZI
```
