# Bandit Level 22 → Level 23

## Level Goal

A program is running automatically at regular intervals from `cron`, the time-based job scheduler. Look in `/etc/cron.d/` for the configuration and see what command is being executed. citeturn878667search2

## Inspecting the Cron Configuration

I moved into the cron configuration directory:

```bash
cd /etc/cron.d
```

I then listed the files:

```bash
ls
```

The relevant cron configuration was then inspected with `cat` to determine which script was being executed.

The cron job for this level runs a script that determines the target filename from the username using an MD5 hash, then writes the corresponding password into `/tmp`. This makes it possible to derive the filename for the next level and read the stored password. citeturn330012search5

## Password

```text
gKXDTAXnIz30BxiPjRZ2uqutUlPZrBsw
```
