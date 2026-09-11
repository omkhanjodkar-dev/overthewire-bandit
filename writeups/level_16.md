# Bandit Level 16 → Level 17

## Level Goal

The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range `31000` to `32000`. After identifying the correct SSL/TLS service, it returns a private SSH key for the next level.

## Finding the Active Port

I used Nmap to scan the port range and identify the active services:

```bash
nmap -sV -p 31000-32000 localhost
```

This showed the open ports and their services. The correct SSL/TLS service was identified on port `31790`.

To send the current password to the service and save the returned output to a file, I used:

```bash
ssh -p 2220 bandit16@bandit.labs.overthewire.org 'echo "kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V" | openssl s_client -connect localhost:31790 -quiet' > bandit17.key
```

## Preparing the SSH Key

The output file contained both the `Correct!` message and the private SSH key. I copied the file to a new name:

```bash
cp bandit17.key a.key
```

I then opened `a.key` with `nano` and removed the extra `Correct!` line so that the file contained only the OpenSSH private key.

## Logging Into Level 17

I used the cleaned private key to connect to `bandit17`:

```bash
ssh -i a.key bandit17@bandit.labs.overthewire.org -p 2220
```

This successfully logged me into Level 17.

## Key Insight

The SSL/TLS service returns a private SSH key rather than a normal password. The extra `Correct!` text had to be removed before using the key with SSH.
