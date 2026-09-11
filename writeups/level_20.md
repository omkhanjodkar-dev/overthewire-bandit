# Bandit Level 20 → Level 21

## Level Goal

There is a setuid binary in the home directory that connects to localhost on a port supplied as a command-line argument. It reads a line from that connection and compares it with the password from the previous level. If the password is correct, it transmits the password for the next level. citeturn878667search5

## Setting Up the Connection

I started a listener on port `4444` and supplied the current level's password as its input:

```bash
nc -l -p 4444 < /etc/bandit_pass/bandit20 &
```

This created a local service waiting for the setuid program to connect to it. The listener received the password and the next-level password was returned through the connection.

An `ls` command was also used during the process.

## Password

```text
bW9kBv5WC3P4yoDyf12LSdGuNz5ka6hY
```
