# Bandit Level 13 → Level 14

## Level Goal

The password for the next level is stored in **/etc/bandit_pass/bandit14** and can only be read by user `bandit14`. For this level, instead of receiving the next password directly, a private SSH key is provided that can be used to log into the next level.

## Initial Observation

Using `ls` in the home directory showed two files:

```text
HINT
sshkey.private
```

The Level 13 password was:

```text
aaWecNkG4FhxJQxz07uiwzVP6bJiYS65
```

I also read the provided `HINT` file, which noted that logging into the next level through `localhost` is blocked and that error messages should be read carefully.

## Private SSH Key

The file `sshkey.private` contained an OpenSSH private key. The key was copied to the local machine so it could be used to authenticate as `bandit14`.

## Mistake 1 — Incorrect SSH Option Placement

The first attempt used:

```bash
ssh -i -p 2220 sshkey.private bandit14@bandit.labs.overthewire.org
```

This was incorrect because `-p` was interpreted as the argument to `-i`. The resulting error was:

```text
Warning: Identity file -p not accessible: No such file or directory.
ssh: connect to host 0.0.8.172 port 22: Unknown error
```

## Mistake 2 — Private Key Permissions on Windows

The corrected SSH command was:

```bash
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```

The server was reached, but SSH rejected the private key because the file permissions were too open:

```text
WARNING: UNPROTECTED PRIVATE KEY FILE!
Permissions for 'sshkey.private' are too open.
This private key will be ignored.
Load key "sshkey.private": bad permissions
```

I attempted to fix this using:

```bash
chmod 700 .\sshkey.private
```

However, `chmod` was not recognized in PowerShell:

```text
chmod : The term 'chmod' is not recognized as the name of a cmdlet...
```

## Mistake 3 — Using WSL but Keeping Windows File Permissions

I opened WSL and ran:

```bash
chmod 700 sshkey.private
```

I then tried the SSH command again, but the key was still reported as having permissions `0777`:

```text
WARNING: UNPROTECTED PRIVATE KEY FILE!
Permissions 0777 for 'sshkey.private' are too open.
This private key will be ignored.
```

I changed the permissions to `600`:

```bash
chmod 600 sshkey.private
```

but the key was still treated as having overly open permissions because it was stored on the Windows-mounted filesystem.

## Mistake 4 — Copying the Key to the WSL Home Directory

I copied the key into the WSL home directory:

```bash
cp sshkey.private ~/sshkey.private
```

Then I set the permissions:

```bash
chmod 600 ~/sshkey.private
```

The SSH command was attempted again:

```bash
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```

This time the permissions issue was gone, but SSH reported:

```text
Load key "sshkey.private": error in libcrypto
```

## Mistake 5 — Key File Corruption / Incorrect Copy

I inspected the copied key with `cat` and opened it for editing with `nano`, but the SSH client continued to return:

```text
Load key "sshkey.private": error in libcrypto
```

At this point, instead of continuing with the locally copied version, I removed it and retrieved a fresh copy directly from the Bandit server.

## Retrieving a Fresh Copy

The old local copy was removed:

```bash
rm ~/sshkey.private
```

I then copied the original key directly from `bandit13` using `scp`:

```bash
scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private ~/sshkey.private
```

After the transfer completed, I set the correct permissions:

```bash
chmod 600 ~/sshkey.private
```

## Successful Login

I used the freshly copied key to log into `bandit14`:

```bash
ssh -i ~/sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```

The login succeeded and I reached the `bandit14` shell.

## Finding the Password

Since the goal stated that the password was stored in `/etc/bandit_pass/bandit14`, I read the file using:

```bash
cat /etc/bandit_pass/bandit14
```

The password found was:

```text
aaWecNkG4FhxJQxz07uiwzVP6bJiYS65
```

## Password

```text
aaWecNkG4FhxJQxz07uiwzVP6bJiYS65
```

## Conclusion

This level required using the supplied private SSH key instead of a password to authenticate as `bandit14`. Several issues were encountered during the process, including incorrect SSH option placement, overly permissive key permissions on Windows and WSL-mounted files, and an `error in libcrypto` caused by the copied key. Retrieving a fresh copy of the private key directly with `scp`, then setting it to `600` permissions in the WSL home directory, allowed the SSH login to succeed.
