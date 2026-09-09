# Bandit Level 9 → Level 10

## Level Goal

The password for the next level is stored in the file **data.txt** in one of the few human-readable strings, preceded by several `=` characters.

## Initial Observation

Using `ls`, I found the `data.txt` file in the home directory.

## Finding the Human-Readable String

I used the `strings` command to extract human-readable strings from `data.txt`:

```bash
strings data.txt
```

Among the output, there were a few strings preceded by multiple `=` characters. The relevant entry was:

```text
R========== B0s2khmbT9u0geKuOoVGW3JZKhndE3BG
```

## Password

```text
B0s2khmbT9u0geKuOoVGW3JZKhndE3BG
```
