# Bandit Level 19 → Level 20

## Level Goal

To gain access to the next level, use the setuid binary in the home directory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual location, `/etc/bandit_pass`, after using the setuid binary. citeturn878667search1

## Using the Setuid Binary

I logged into the server using:

```bash
ssh bandit19@bandit.labs.overthewire.org -p 2220
```

I then used the setuid binary to inspect the password directory:

```bash
ssh bandit19@bandit.labs.overthewire.org -p 2220 './bandit20-do ls /etc/bandit_pass'
```

After confirming the target password file, I read it with:

```bash
ssh bandit19@bandit.labs.overthewire.org -p 2220 './bandit20-do cat /etc/bandit_pass/bandit20'
```

The command executed with the privileges provided by the setuid binary and returned the password for Level 20.

## Password

```text
4pIjcunZ0fK2vmp3IwfG8Vf7VhxD6pOA
```
