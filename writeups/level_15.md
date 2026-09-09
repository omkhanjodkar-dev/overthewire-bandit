# Bandit Level 15 → Level 16

## Level Goal

The password for the next level can be retrieved by submitting the password of the current level to **port 30001 on localhost** using SSL/TLS encryption.

## Initial Observation

I checked the `openssl` manual and then connected to the SSL/TLS service using:

```bash
openssl s_client -connect localhost:30001
```

The connection was established successfully. The server used a self-signed certificate and negotiated TLS 1.3.

## Initial Attempt

After connecting, I entered the current password:

```text
pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7
```

The server returned:

```text
Wrong! Please enter the correct current password.
```

This happened while interacting with the OpenSSL client directly.

## Successful Attempt

I connected to the same SSL/TLS service again and submitted the current password correctly. The server returned:

```text
Correct!
kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V
```

## Password

```text
kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V
```
