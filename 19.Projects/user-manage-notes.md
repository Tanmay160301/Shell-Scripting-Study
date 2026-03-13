# Linux User Management Commands

These are **Linux user management commands** used by system administrators to manage user accounts.  
They are part of **standard Linux administration** and usually require **root privileges**.

---

# 1. `useradd`

`useradd` is used to **create a new user account** on a Linux system.

## Basic Syntax

```bash
useradd username
```

### Example

```bash
useradd john
```

This creates a user `john`, but by default it **may not create a home directory** unless configured.

---

## Common Options

| Option | Meaning |
|------|------|
| `-m` | Create home directory |
| `-s` | Set login shell |
| `-d` | Specify home directory |
| `-u` | Specify user ID |
| `-g` | Specify primary group |
| `-G` | Add to secondary groups |

---

## Example 1 — Create User with Home Directory

```bash
useradd -m john
```

Creates:

```
/home/john
```

---

## Example 2 — Specify Shell

```bash
useradd -m -s /bin/bash john
```

This sets the login shell.

---

## Example 3 — Add User to Groups

```bash
useradd -m -G sudo john
```

Adds the user to the **sudo group**.

---

## After Creating a User

You usually set a password:

```bash
passwd john
```

---

# 2. `usermod`

`usermod` is used to **modify an existing user account**.

## Basic Syntax

```bash
usermod [options] username
```

---

## Common Options

| Option | Meaning |
|------|------|
| `-s` | Change login shell |
| `-d` | Change home directory |
| `-m` | Move home directory |
| `-l` | Change username |
| `-aG` | Add user to group |

---

## Example 1 — Change Shell

```bash
usermod -s /bin/zsh john
```

Now the user logs in with **zsh instead of bash**.

---

## Example 2 — Add User to Group

```bash
usermod -aG docker john
```

Adds `john` to the **docker group**.

⚠️ `-a` means **append**, otherwise existing groups will be removed.

---

## Example 3 — Rename User

```bash
usermod -l jack john
```

Changes username:

```
john → jack
```

---

## Example 4 — Move Home Directory

```bash
usermod -d /home/jack -m john
```

Moves the home directory to a new location.

---

# 3. `userdel`

`userdel` is used to **delete a user account**.

## Basic Syntax

```bash
userdel username
```

### Example

```bash
userdel john
```

This removes the user but **keeps the home directory**.

---

## Common Options

| Option | Meaning |
|------|------|
| `-r` | Remove home directory |
| `-f` | Force delete |

---

## Example 1 — Delete User Only

```bash
userdel john
```

Removes user entry from:

- `/etc/passwd`
- `/etc/shadow`

But keeps:

```
/home/john
```

---

## Example 2 — Delete User and Home Directory

```bash
userdel -r john
```

Removes:

- `/home/john`
- `/etc/passwd` entry
- `/etc/shadow` entry
- `/var/mail/john`

---

# Where Linux Stores User Information

User commands modify system files like:

| File | Purpose |
|------|------|
| `/etc/passwd` | User account information |
| `/etc/shadow` | Encrypted passwords |
| `/etc/group` | Group information |

### Example `/etc/passwd` Entry

```bash
john:x:1001:1001:John:/home/john:/bin/bash
```

---

# Quick Comparison

| Command | Purpose |
|------|------|
| `useradd` | Create new user |
| `usermod` | Modify existing user |
| `userdel` | Delete user |

---

# Example Workflow

## Create User

```bash
useradd -m john
passwd john
```

## Modify User

```bash
usermod -aG sudo john
```

## Delete User

```bash
userdel -r john
```

---

# Summary

In simple terms:

- **`useradd` → create user**
- **`usermod` → modify user**
- **`userdel` → delete user**

These are the **core Linux commands for user account management**.