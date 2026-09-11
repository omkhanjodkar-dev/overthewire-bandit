# Bandit Level 21 → Level 22

## Level Goal

A program is running automatically at regular intervals from **cron**, the time-based job scheduler. The goal is to look in `/etc/cron.d/` for the configuration and determine what command is being executed. citeturn779598search1

## Initial Observation

The important clue is that the program is not something that needs to be executed manually. It is being run automatically by a cron job, so the first step is to inspect the cron configuration directory.

## Inspecting the Cron Jobs

I navigated to `/etc/cron.d/` and listed the available cron jobs:

```bash
cd /etc/cron.d
ls
```

Among the cron job files was `cronjob_bandit22`.

I then read its contents:

```bash
cat cronjob_bandit22
```

The configuration runs `/usr/bin/cronjob_bandit22.sh` as the `bandit22` user at regular intervals. The standard cron configuration for this level runs the script every minute (and also at reboot). citeturn779598search0turn779598search5

## Inspecting the Script

Since the cron job points to `/usr/bin/cronjob_bandit22.sh`, I inspected the script:

```bash
cat /usr/bin/cronjob_bandit22.sh
```

The script performs two important operations:

```bash
chmod 644 /tmp/<generated-filename>
cat /etc/bandit_pass/bandit22 > /tmp/<generated-filename>
```

This means the cron job reads the password belonging to `bandit22` and copies it into a file under `/tmp/`. The file is then given permissions that allow it to be read. citeturn779598search0turn779598search3

## Retrieving the Password

The filename to read is given directly by the script. I read that generated file with `cat` to retrieve the password for the next level.

```bash
cat /tmp/<generated-filename>
```

The password obtained was:

```text
RYVux2rHEm9tiXHmLFzuR7Vhx6AZQMEzS
```

## Password

```text
RYVux2rHEm9tiXHmLFzuR7Vhx6AZQMEzS
```

## Key Takeaway

This level demonstrated how to trace an automatically executed cron job: find the cron configuration, identify the script it runs, inspect the script's behavior, and follow where it writes the next password.
