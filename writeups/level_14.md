# Bandit Level 14 → Level 15

## Level Goal

The password for the next level can be retrieved by submitting the password of the current level to **port 30000 on localhost**.

## Initial Observation

From the previous level, I learned that using a Linux-based environment such as Kali is more suitable for these exercises than working directly from Windows.

## Finding the Password

The current password was already available in the password file for Bandit 14. I submitted it to port 30000 on localhost using `nc`:

```bash
cat /etc/bandit_pass/bandit14 | nc localhost 30000
```

The server responded with:

```text
Correct!
pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7
```

## Password

```text
pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7
```
