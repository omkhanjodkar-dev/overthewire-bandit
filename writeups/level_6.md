# Bandit Level 6 → Level 7

## Level Goal

The password for the next level is stored somewhere on the server and has all of the following properties:

- owned by user `bandit7`
- owned by group `bandit6`
- 33 bytes in size

## Finding the File

Using `ls` in the home directory showed no relevant files.

I searched the entire server with:

```bash
find / -user bandit7 -group bandit6 -size 33c
```

The command produced many `Permission denied` messages, but only one matching path appeared without a permission error:

```text
/var/lib/dpkg/info/bandit7.password
```

## Finding the Password

I read the contents of the file using:

```bash
cat /var/lib/dpkg/info/bandit7.password
```

The password found was:

```text
Bmnnvf82KzQlfxgAI2d1zYbr1u9pr3E3
```

## Password

```text
Bmnnvf82KzQlfxgAI2d1zYbr1u9pr3E3
```
