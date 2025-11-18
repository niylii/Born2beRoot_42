# OPERATING SYSTEMS COURSE
**English Translation - Complete Course Material**

Faculty of Polytechnic Studies, Taroudant  
Ibn Zohr University, Agadir  
Computer Engineering Degree - Semester 3  
Professor: EL BAZZI Mohamed Salim  
Academic Year: 2025-2026

---

## PART 1: INTRODUCTION TO OPERATING SYSTEMS

### What is an Operating System?

**Definition:**
An operating system (OS) is a set of programs that manage the computer and its peripherals. It provides the minimal environment to manage peripherals and software. It consists of several complex programs whose purpose is to make computer usage easier.

**Purpose:**
- Simplify life for users and programmers
- Manage machine resources efficiently
- Provide abstraction layer between hardware and applications

### Functions of an Operating System

An OS performs several critical functions:
1. **Memory Management** - Allocates and manages RAM
2. **File System Management** - Organizes data storage
3. **Process Management** - Controls running programs
4. **Synchronization Mechanisms** - Coordinates concurrent operations
5. **Device Management** - Controls hardware peripherals
6. **Network Management** - Handles network communications
7. **Security Management** - Protects system resources

### Computer System Layers

```
User 1, User 2, User 3, ... User N
         ↓
Application Programs (Compiler, Assembler, Text Editor, Database, ...)
         ↓
Operating System
         ↓
Computer Hardware
```

### Abstraction Concept

**Purpose:** Hide machine complexity from users so they can use the machine without knowing what's behind it.

**Abstraction Layers:**
- **Real Machine:** CPU + Peripherals
- **Abstract Machine (OS Layer):** Real machine + Operating System
- **Usable Machine:** Abstract machine + Applications

---

## UNIX Philosophy

### Core Characteristics

**Multitasking:**
- Multiple processes execute simultaneously
- OS controls process execution

**Multi-user:**
- Multiple users can connect simultaneously
- Multiple users can execute processes simultaneously

**Features:**
- Multiple command interpreters (Shells)
- Large number of commands and utilities
- Compilers for many languages
- Text processing, email, and more

### UNIX/Linux Structure

```
┌─────────────────────────────┐
│      Userland (User Space)  │
│   Applications & Utilities   │
├─────────────────────────────┤
│    Kernel Space (Kernel)    │
│  Provides services to users  │
├─────────────────────────────┤
│         Hardware            │
└─────────────────────────────┘
```

### The UNIX Kernel

**Definition:** The kernel is the heart of the UNIX operating system. It's a software application that provides the interface between hardware and users.

**Main Components:**
1. **Task/Process Manager (Scheduler)**
   - Divides time into slices
   - Manages running processes

2. **Memory Manager**
   - Tracks free and occupied memory
   - Allocates memory to processes
   - Recovers unused memory

3. **File Manager**
   - Abstracts disk and I/O device specifics
   - Provides uniform file access

4. **Device Manager**
   - Sends commands to devices
   - Handles errors

### The Shell

**Definition:** The shell is the program between the user and the kernel. It's the interpreter that translates commands typed in the terminal session.

**Usage:**
- Users can enter commands directly in the terminal
- Users can create text files containing command series (scripts)

**Common Shell Types:**
- **sh** - Bourne Shell (ancestor of all shells)
- **bash** - Bourne Again Shell (default on Linux and Mac OS X)
- **ksh** - Korn Shell (powerful, available on proprietary Unix)
- **csh** - C Shell (syntax similar to C language)
- **tcsh** - Tenex C Shell (improvement of C Shell)
- **zsh** - Z Shell (recent, combines best ideas from bash, ksh, tcsh)

---

## Linux Operating System

### What is Linux?

**Definition:** Linux is a Unix-family operating system originally created by Linus Torvalds with help from developers worldwide. Developed under the GNU General Public License, Linux source code is freely available to everyone.

### Linux Characteristics

1. **Multitasking and Multi-user**
2. **Dynamic device driver management** - modules loaded dynamically
3. **Supports multiple file systems** including Windows and Macintosh
4. **Open source and free software**

### Free Software

**Definition:** "Free Software" refers to users' freedom to run, copy, distribute, study, modify, and improve software.

**Four Essential Freedoms:**
1. **Freedom to run** the program for any purpose
2. **Freedom to study** how the program works and adapt it to your needs
3. **Freedom to redistribute copies** to help your neighbor
4. **Freedom to improve** the program and release improvements to the public for community benefit

### Open Source vs Free Software

**Open Source:**
- Implies source code is available to the public
- Encompasses free software but also proprietary software
- Linux is open source software
- **Cannot resell** open source software

**Free Software:**
- Emphasizes user freedom
- All free software is open source
- Not all open source is free software

### Linux Distributions

**Definition:** A distribution is a working environment with its graphics, philosophy, and software.

**Popular Distributions:**
- openSUSE
- Mandriva
- Red Hat
- Fedora
- CentOS
- Kubuntu
- Ubuntu
- Linux Mint

**Note:** It's possible to interchange elements from one distribution to another.

---

## Interaction Modes

### Two Primary Modes

**1. CLI (Command Line Interface)**
- Screen with text lines
- Type commands via keyboard
- Computer executes and displays results
- More powerful and efficient for advanced users

**2. GUI (Graphical User Interface)**
- Use pointer to manipulate graphical objects
- Click icons in windows to activate tasks
- More intuitive for beginners

### Operating Modes

**Two operation modes:**

1. **Supervisor Mode** (Kernel, Privileged, Master)
   - For the operating system
   - All instructions are authorized
   - Full hardware access

2. **User Mode** (Slave)
   - For user programs and utilities
   - Certain instructions not permitted
   - Restricted hardware access

**Important Note:**
- Not recommended to always work as root
- Preferable to have ordinary account and execute `su` command when needed
- `su` changes identity but not environment
- Symbol `$` for ordinary user, `#` for root
- Use `Ctrl+U` to cancel input errors

---

## File System Management

### File System Overview

**Definition:** The file system (FS) is the most visible part of an OS, responsible for managing storage and file manipulation.

**Main Role:**
- Manage files
- Provide primitives to manipulate files

### Partitioning and Formatting

#### A. Partitioning

**Purpose:** Separate the disk into sections

**Benefits:**
- Allows cohabitation of multiple operating systems on same disk
- Isolates certain system parts

**Storage:** Partition information stored in first sector (sector zero) - the MBR (Master Boot Record)

**Two Partition Types:**

1. **Primary Partitions**
   - Can create up to 4 primary partitions on same disk

2. **Extended Partition**
   - Divides a primary partition into sub-partitions
   - Contains one or more logical partitions
   - Logical partitions behave like primary partitions
   - Created differently (no boot sectors)

**Device Naming:**
```
/dev/hda1   (Primary partition 1)
/dev/hda2   (Primary partition 2)
/dev/hda3   (Primary partition 3)
/dev/hda4   (Extended partition)
  /dev/hda5 (Logical partition 1)
  /dev/hda6 (Logical partition 2)
```

**Multi-partition Example:**
```
┌──────────┬───────┬────────┐
│ WINDOWS  │ SWAP  │ LINUX  │
│/dev/hda1 │hda2   │/dev/hda3│
└──────────┴───────┴────────┘
  MBR
```

#### B. Formatting

**Purpose:** Before a file system can create and manage files, storage unit must be formatted according to file system specifications.

**Process:**
- Inspects sectors
- Erases data
- Creates root directory of file system
- Creates superblock to store information ensuring file system integrity

### Linux File Systems

#### Ext (Extended File System)
- First created specifically for Linux in 1992
- Many distributions no longer support Ext

#### Ext2
- Useful for flash memory like USB drives
- Developed in 1993
- Limited to 2 TB
- Not a journaling file system

#### Ext3
- Simply Ext2 with journaling
- Designed to be backward compatible with Ext2
- Can convert partitions between Ext2 and Ext3 without formatting

#### Ext4
- Designed to be backward compatible
- Includes features reducing file fragmentation
- Default version on most Linux distributions
- Limited to 1 EB (Exabyte)
- Maximum file size: 16 TB

#### BtrFS (B-Tree File System)
- Limited to 16 EB
- Adapted for many small files
- Future of Ext4

#### ZFS
- Limited to 1 Zettabyte
- Data protection mechanisms preventing corruption
- Adopts copy-on-write model limiting write errors
- Uses `scrub` command instead of `fsck` for regular disk verification

#### XFS
- Similar to Ext4
- Performs well with large files
- Less performant with many small files
- Limited to 8 EB

#### SWAP
- Not a real file system
- Used as virtual memory
- No file system structure
- Cannot mount to view contents
- Used as workspace by Linux kernel to temporarily store data that doesn't fit in RAM

### Journaling File Systems

**Concept:** A journaling filesystem notes all upcoming transactions before executing them.

**Benefits:**
- In case of crash, system knows what was done and what wasn't
- Duration of fsck at boot no longer depends on filesystem size
- Knows where to look

**Examples:** ext3, ext4, jfs, xfs, ReiserFS, Reiser4

---

## File Types and Structure

### File System Tree Structure

**Definition:** Unix file system is a vast tree where:
- Nodes are directories
- Leaves are files

**A file can:**
- Contain data
- Be a link to another file
- Be a means of accessing a device (memory, screen, hard disk, ...)
- Be a communication channel between processes

### Different File Types

| Type | Symbol | Description |
|------|--------|-------------|
| Regular file | `-` | Byte sequence without structure |
| Directory | `d` | Contains information about files and subdirectories |
| Symbolic link | `l` | Special file containing location of file to reference |
| Character device | `c` | Special files in /dev directory |
| Block device | `b` | Block-oriented devices |
| Named pipe | `p` | Files on disk managed as pipe between processes |
| Socket | `s` | Local IPC socket |
| Hidden file | `.name` | Files starting with dot |

### I-nodes

**Each file corresponds to an i-node containing:**
- File type and access rights
- Owner identification
- File size
- Number of physical links to file
- Last modification/access date (read/write)
- Last i-node modification date (attribute changes)
- Associated resource identification (for special files)

### File Names

**Purpose:** File name must identify it within a file set

**Composition:**
- Made of characters
- Often composed of two parts:
  - Base name
  - Extension (after `.` character)
- Extension designates content nature (text, image, sound, ...)

**Acceptable Characters for Unix File Names:**

| Characters | Meaning |
|------------|---------|
| A-Z | Uppercase letters |
| a-z | Lowercase letters |
| 0-9 | Digits |
| `_`, `,` | Underscore and comma |
| `.` | Dot character |

**Important:** Unix distinguishes between uppercase and lowercase characters

**Warning:** Do not use space character in file or directory names!

### File Paths

**Full File Name = Path + Name**

**Components:**
- **Separator:** `/` (forward slash)
- **Path:** Directories from root to file's directory
- **Name:** File name

**Example:** `/home/student1/data/File.txt`

**Two Path Types:**

1. **Absolute Path**
   - Starts with separator `/`
   - Expresses complete path from root
   - Example: `/home/User/Documents/Doc1.txt`

2. **Relative Path**
   - Starts with character other than separator
   - Indicates path from current working directory
   - `..` designates parent directory
   - `.` designates current directory
   - Example: `../../home/User/Documents/Doc1.txt`

### Path Examples

**Directory Tree:**
```
/
├── boot/
│   └── grub/
│       ├── efi/
│       ├── grub.cfg
│       └── config
├── dev/
├── etc/
├── home/
│   └── User/
│       ├── Documents/
│       │   ├── Doc1.txt
│       │   └── Doc2.txt
│       ├── Images/
│       │   ├── img1.png
│       │   └── img2.jpeg
│       └── networks
├── lib/
├── mnt/
└── proc/
```

**Examples:**
- Current directory: `/boot/grub`
- Absolute path to Doc1.txt: `/home/User/Documents/Doc1.txt`
- Relative path to Doc1.txt: `../../home/User/Documents/Doc1.txt`

### File Access Commands

| Command | Explanation |
|---------|-------------|
| `cp source destination` | Copy file (duplicates content and creates entry in directory) |
| `mv source destination` | Move/rename file (deletes entry in directory and creates new entry) |
| **Warning:** Copying/moving to existing file will overwrite it |

### Links (Physical and Symbolic)

#### Physical Links (Hard Links)
- Same file can have multiple names
- Multiple physical links to same file
- Simple entry pointing to an inode
- Can have several hard links to one inode (multiple names for same content)

**Diagram:**
```
fichier1 ────┐
             ├──→ inode1
fichier2 ────┘
```

#### Symbolic Links (Soft Links)
- Symbolic link is a file of type "link" containing path and name of another file
- Accesses to link are redirections to another file
- Behaves like shortcut/alias to another file
- Link content is either absolute or relative path (must be valid from directory containing link!)
- If target deleted, link becomes broken

**Diagram:**
```
fichier1 ────→ fichier2 ────→ inode1
```

**Commands:**
- `ln original destination` - Create hard link
- `ln -s original destination` - Create symbolic link
- `stat filename` - Show all inode information

---

## PART 2: USERS, GROUPS, AND ACCESS RIGHTS

### Accounts and Groups

**Three Types of Linux Accounts:**

1. **Administrator**
   - Only one possible
   - Called superuser
   - Account name: **root**
   - Some systems prevent direct connection as root has all rights

2. **System Accounts**
   - Associated with certain services (printer, network, ...)
   - Generally not connectable

3. **Ordinary Users**
   - Regular user accounts
   - Limited privileges

### The Root Superuser

**Characteristics:**
- Always considered by system as owner of all files and processes
- Person managing system is normally the only one knowing password
- Only root can add new users to system

**How to Become Root:**

**Method 1 - Direct Login:**
```bash
login: root
password: [hidden]
#
```

**Method 2 - Switch User (Temporary):**
```bash
$ su
password: [hidden]
# exit
$
```

### User Connection

**Administrator Role:**
- Create, modify, and delete users

**Important Notes:**
- Not recommended to always work as root
- Preferable to have ordinary account
- Use `su` command when root privileges needed
- `su` changes identity but not environment
- Error during name/password entry allows retry
- Use `Ctrl+U` to cancel input error

### Password Modification

**Command:** `passwd`

**Characteristics:**
- Passwords assigned to each user are encrypted
- Difficult to recover password even for superuser
- User can change password anytime
- When changing, must provide old password

### User and Group Concepts

**Login System:**
- User must be connected to access file system
- Must enter login and associated password
- Each login corresponds to a UID (User IDentifier)
- Each user belongs to at least one user group
- Each group has a GID (Group IDentifier)

**Administration Files:**
- `/etc/passwd` - Contains user information (login, encrypted password, uid, gid, full name, home directory, login command)
- `/etc/group` - Contains group information (name, password, gid, member list)
- User can belong to multiple groups

### /etc/passwd File

**Format - Seven Fields per User:**
```
login:password:UID:GID:GECOS:home_dir:shell
```

**Example:**
```
root:x:0:0:Linux Torvalds,,,:/root:/bin/bash
```

**User Types:**
- **root** - UID 0, owner of almost all system files, has all rights
- **System users** - UID < 1000 (daemon, postfix, sshd, ...)
- **Real users** - UID ≥ 1000 (Med, Sami)

**Note:** Passwords defined in `/etc/shadow` (x indicates shadow passwords)

### /etc/shadow File

**Characteristics:**
- Only root can read/modify this file
- Contains encrypted password and validity parameters

**Format:**
```
login:encrypted_password:6_validity_fields:1_reserved_field
```

**Example:**
```
mblanc:$1$QJbtH...jL:13428:0:99999:7:::
```

### /etc/group File

**Format - Four Fields per Line:**
```
group_name:password:GID:member_list
```

**Concepts:**
- Each user generally has a group with same name (Unique Private Group - primary group)
- User can belong to N secondary groups
- System groups often allow users to manipulate devices (cdrom, fax, audio, ...)

**Example:**
```
root:x:0:
dialout:x:20:cupsys,acox,ttso,ltorvalds
cdrom:x:24:haldaemon,acox,ttso,ltorvalds
audio:x:29:ttso,ltorvalds
acox:x:1000:
```

### User Management Commands

**Identity Commands:**
- `whoami` - Who am I?
- `id` - Show user ID and group memberships
- `groups` - Show groups I belong to

**Presence Commands:**
- `who` - Who is logged in?
- `users` - List logged-in users
- `last` - Who was logged in?
- `lastlog` - Last login times
- `w` - Who is doing what?

**List Users:**
- `lastlog` - Show all user login times
- `cat /etc/passwd` - View all users

### Changing Identity

**`su` Command (Switch User):**
- Allows executing command or opening shell as another user
- Requires typing target user's password (except if you are root)

**Syntax:**
```bash
su - username
```

**`sudo` Command:**
- Allows executing command as another user
- Requires typing YOUR password
- Possibilities defined in `/etc/sudoers`

### User Account Management Commands

**Account Management:**
- `useradd`, `usermod`, `userdel` - Manage user accounts
- `groupadd`, `groupmod`, `groupdel` - Manage group accounts
- `pwck`, `grpck` - Verify `/etc/passwd` and `/etc/group` files
- `finger` - Give information about a user
- `passwd` - Modify user password
- `su` - Connect to an account

---

## Directory and File Structure

### Linux File Organization

**Linux organizes system files in tree structure (arborescence):**

**Three File Types:**
1. **Ordinary files** - Store programs and user/system data
2. **Directory files** - Structure the arborescence
3. **Special files** - Designate peripherals, pipes, or other inter-process communication supports

**Root Directory:**
- Highest directory in arborescence
- Named **root** (symbolized by `/`)
- Arborescence is unique

### Important Directories

| Directory | Contents |
|-----------|----------|
| `/etc` | Configuration files for system and applications |
| `/dev` | Special device files representing hardware access points |
| `/bin` | Basic system commands |
| `/sbin` | System tools for administration |
| `/usr` | Commands and applications for users, including graphical environments |
| `/home` | User personal directories |
| `/var` | Variable content files (databases, logs, ...) |
| `/proc` | Access point to variable kernel and process information (tables, lists, ...) |
| `/boot` | Boot files including kernel and boot loader |
| `/lib` | Shared libraries for system programs |
| `/mnt` | Temporary mount points for filesystems |

---

## Access Rights

### Security Concepts

**Basic Elements:**
- **Subject:** User or Process wanting to execute an operation
- **Object:** File on which we want to execute an operation
- **Operation:** Action we want to execute

**Security Rules:**
- Indicate operations (rights) authorized for a subject on an object
- System verifies subject has right to execute operation on object

### Unix Access Rights

**File Ownership:**
- Each file belongs to one user and one group
- Unix distinguishes three subject types:
  1. File owner
  2. Member of file's group
  3. Others (everyone else)

**For each user class, three access types:**

| Permission | Symbol | File Meaning | Directory Meaning |
|------------|--------|--------------|-------------------|
| Read | `r` | Read file content | List directory contents |
| Write | `w` | Modify file data | Create/delete files in directory |
| Execute | `x` | Execute file (if script/program) | Traverse directory (cd into it) |
| None | `-` | Permission not granted | Permission not granted |

### Permission Display

**Example:**
```bash
$ ls -l file
-rwxrwxrwx tux ZOO ... file
```

**Format:**
```
-rwxrwxrwx
│││││││││└─ Others: execute
││││││││└── Others: write
│││││││└─── Others: read
││││││└──── Group: execute
│││││└───── Group: write
││││└────── Group: read
│││└─────── User: execute
││└──────── User: write
│└───────── User: read
└────────── File type
```

**File Type Symbols:**

| Symbol | Type |
|--------|------|
| `-` | Regular file |
| `d` | Directory |
| `l` | Symbolic link |
| `c` | Character device |
| `b` | Block device |
| `p` | Named pipe (FIFO) |
| `s` | Socket |

**User Classes:**
- **u** (User) - File owner
- **g** (Group) - Group members
- **o** (Others) - Everyone else
- **a** (All) - All users (u+g+o)

### Permission Modification Commands

**Change Owner:**
```bash
chown newowner file
chown newowner:newgroup file
```

**Change Group:**
```bash
chgrp newgroup file
```

**Change Permissions:**
```bash
chmod mode file
```

### chmod Command - Symbolic Mode

**Syntax:** `chmod [who][action][permissions] file`

**Components:**
- **who:** u (user), g (group), o (others), a (all)
- **action:** + (add), - (remove), = (set exactly)
- **permissions:** r (read), w (write), x (execute)

**Examples:**
```bash
chmod u+rwx file    # Add all permissions to owner
chmod o-w file      # Remove write from others
chmod a+rx file     # Give read+execute to all
chmod g=rwx file    # Set group to read+write+execute
```

### chmod Command - Numeric Mode

**Octal Representation:**

| Permissions | Binary | Octal |
|-------------|--------|-------|
| `---` | 000 | 0 |
| `--x` | 001 | 1 |
| `-w-` | 010 | 2 |
| `-wx` | 011 | 3 |
| `r--` | 100 | 4 |
| `r-x` | 101 | 5 |
| `rw-` | 110 | 6 |
| `rwx` | 111 | 7 |

**Format:** Three digits representing owner, group, others

**Examples:**
```bash
chmod 700 file   # rwx------
chmod 751 file   # rwxr-x--x
chmod 640 file   # rw-r-----
chmod 755 file   # rwxr-xr-x
chmod 644 file   # rw-r--r--
```

**Calculation Example:**
```
chmod 765 file
7 = 111 = rwx (owner)
6 = 110 = rw- (group)
5 = 101 = r-x (others)
```

### umask Command

**Purpose:** Specify default permissions for newly created files

**Default Maximum Permissions:**
- Files: 666 (rw-rw-rw-)
- Directories: 777 (rwxrwxrwx)

**Calculation:**
```
Actual permissions = Maximum permissions - umask
```

**Examples:**

**For Files:**
```
umask 022:
  Maximum: 666 (rw-rw-rw-)
  Mask:    022 (----w--w-)
  Result:  644 (rw-r--r--)

umask 227:
  Maximum: 666 (rw-rw-rw-)
  Mask:    227 (-w--w-rwx)
  Result:  440 (r--r-----)
```

**For Directories:**
```
umask 022:
  Maximum: 777 (rwxrwxrwx)
  Mask:    022 (----w--w-)
  Result:  755 (rwxr-xr-x)

umask 244:
  Maximum: 777 (rwxrwxrwx)
  Mask:    244 (-w-r--r--)
  Result:  533 (r-x-wx-wx)
```

**Commands:**
```bash
umask          # Display current mask
umask 022      # Set new mask
```

**Note:** umask only usable if you are file owner

---

## PART 3: TEXT EDITORS AND FILE COMMANDS

### Text Editors

#### CAT and ECHO

**Always Available - Not Really Editors:**

```bash
$ echo "Hello World" > text.txt
$ cat text.txt
Hello World

$ echo "Hello World" >> text.txt
$ cat text.txt
Hello World
Hello World
```

#### Vi/Vim Editor

**About Vi:**
- Vi is a full-screen text mode editor
- Vi or one of its clones can be found in almost all Unix installations
- Modern version: Vim (Vi IMproved)

**Installation:**
```bash
sudo apt-get install vim
```

**Set Default Editor (Debian/Ubuntu):**
```bash
sudo update-alternatives --config editor
```

**Two Modes:**
1. **Command Mode** - What you type is considered a command (doesn't display)
2. **Insert Mode** - What you type writes to file

**Mode Switching:**
- Command → Insert: `i`, `o`, `a`
- Insert → Command: `Esc`

**Vi Commands:**

| Command | Action |
|---------|--------|
| `n↓` | Move down n lines |
| `i` | Enter insert mode |
| `o` | Insert line below and enter insert mode |
| `dd` | Delete current line |
| `dw` | Delete current word |
| `D` | Delete to end of line |
| `/pattern` | Search for pattern |
| `n` | Next search occurrence |
| `:w` | Write file to disk |
| `:q` | Quit vi |
| `:q!` | Quit vi despite warnings |
| `:x` | Write and quit (equivalent to :wq) |
| `:nG` | Go to line n (omit n to go to end) |

#### Emacs Editor

**About Emacs:**
- GNU Emacs is a text editor with numerous features
- Written by Richard M. Stallman in 1976
- Part of GNU project
- Available in console and graphical versions
- Very different from Vim in approach
- Uses mainly Ctrl and Alt keys

**Installation:**
```bash
sudo apt-get install emacs
```

**Usage:**
```bash
sudo emacs /etc/passwd
```

**No Visual/Insert Mode:**
- Editing can begin immediately when opened

**Essential Emacs Shortcuts:**

| Shortcut 1 | Shortcut 2 | Action |
|------------|------------|--------|
| Ctrl-X | Ctrl-C | Quit |
| Ctrl-X | K | Close buffer |
| Ctrl-X | F | Open file |
| Ctrl-X | Ctrl-S | Save file |
| Ctrl-X | H | Select entire buffer |
| Ctrl-W | | Cut selected region |
| Ctrl-Y | | Paste |
| Ctrl-S | | Search in text |
| Ctrl-_ | | Undo modification |
| Ctrl-X | Ctrl-H | Help with Ctrl key |

**Save and Quit:**
1. Save: Ctrl-X followed by Ctrl-S
2. Quit: Ctrl-X followed by Ctrl-C

#### Other Editors

**CLI Editors:**
- aee, ed, e3, joe, jed, nano, pico

**X Window:**
- xed, xwpe, axe

**Gnome:**
- gedit, gnotepad, scite, scribes

**KDE:**
- kate, kedit

---

## Shell Commands for File Manipulation

### pwd - Print Working Directory

**Purpose:** Display current working directory path

**Usage:**
```bash
$ pwd
/home/student
```

When user logs in, they are placed in personal directory (usually in /home).

### cd - Change Directory

**Purpose:** Change current directory

**Syntax:**
```bash
cd [path]
```

**Examples:**
```bash
cd              # Go to home directory
cd ~            # Go to home directory
cd .            # Stay in current directory (no change)
cd ..           # Go to parent directory
cd /            # Go to root directory
cd /home/user   # Go to absolute path
cd Documents    # Go to relative path
```

### ls - List Files

**Purpose:** List directory contents

**Syntax:**
```bash
ls [options] [path]
```

**Common Options:**

| Option | Description |
|--------|-------------|
| `-l` | Long format (type, permissions, links, owner, group, size, date, name) |
| `-a` | List all files including hidden files (starting with `.`) |
| `-F` | Short format with type indication (`/` for directory, `*` for executable) |
| `-i` | Display inode numbers |
| `-R` | Recursive (list entire subtree) |
| `-r` | Sort in reverse order |
| `-d` | List directory itself, not contents |

**Examples:**
```bash
ls              # List current directory
ls -l           # Long format listing
ls -la          # Long format with hidden files
ls /etc         # List /etc directory
ls -lh          # Long format with human-readable sizes
```

### Meta Characters (Wildcards)

**Purpose:** Specify sets of files without entering all names

**Common Wildcards:**

| Character | Meaning |
|-----------|---------|
| `*` | Replaced by any sequence of characters |
| `?` | Replaced by exactly one character |
| `[abc]` | Replaced by one of the characters in brackets |
| `[a-z]` | Range of characters (all lowercase letters) |
| `[0-9]` | All digits |

**Examples:**
```bash
ls *.c          # All files ending with .c
ls file?.txt    # file1.txt, file2.txt, fileA.txt
ls [abc]*       # Files starting with a, b, or c
ls file[1-5]    # file1, file2, file3, file4, file5
```

### cat - Concatenate and Display Files

**Purpose:** Display file contents to standard output

**Syntax:**
```bash
cat [files...]
```

**Examples:**
```bash
cat file.txt            # Display file contents
cat file1 file2         # Display both files sequentially
cat                     # Read from keyboard until EOF (Ctrl+D)
```

### more - Page by Page Display

**Purpose:** Display file content page by page

**Syntax:**
```bash
more [files...]
```

**Controls:**
- Space: Next page
- Enter: Next line
- q: Quit

### touch - Create Empty Files

**Purpose:** Create empty files or update timestamps

**Syntax:**
```bash
touch [files...]
```

**Example:**
```bash
touch f1.txt f2.txt     # Create two empty files
ls -l f1.txt            # Verify creation
cat f1.txt              # Verify empty
```

### file - Determine File Type

**Purpose:** Determine file type based on file header

**Syntax:**
```bash
file [filename]
```

**Example:**
```bash
$ file test.c
test.c: c program text

$ file image.jpg
image.jpg: JPEG image data
```

### mv - Move/Rename Files

**Purpose:** Move or rename files

**Syntax:**
```bash
mv [options] source destination
```

**Behavior:**
- If destination is directory: move source to destination
- If destination is filename: rename source to destination

**Options:**
- `-i` - Interactive (ask before overwriting)

**Examples:**
```bash
mv file.txt newname.txt     # Rename file
mv file.txt /tmp/           # Move to /tmp directory
mv -i file.txt existing.txt # Ask before overwrite
```

### cp - Copy Files

**Purpose:** Copy files

**Syntax:**
```bash
cp [options] source destination
```

**Behavior:**
- If destination is directory: copy source into destination
- If destination is filename: create copy with new name

**Important Options:**
- `-i` - Interactive (warn if destination exists)
- `-b` - Backup (save overwritten file with `~` suffix)
- `-p` - Preserve (keep owner, group, creation date)
- `-r` - Recursive (copy directories and subdirectories)

**Examples:**
```bash
cp file1.txt file2.txt      # Copy and rename
cp file.txt /backup/        # Copy to directory
cp -i file.txt existing.txt # Warn before overwrite
cp -r dir1/ dir2/           # Copy directory recursively
```

### ln - Create Links

**Purpose:** Create hard or symbolic links

**Syntax:**
```bash
ln [options] target linkname
```

**Hard Links:**
```bash
ln original hardlink
```
- Alternative name for file
- Points to same inode
- Deleting one link doesn't delete file (until all links removed)

**Symbolic Links:**
```bash
ln -s original symlink
```
- Virtual pointer/shortcut to real file
- Deleting symlink doesn't delete target
- If target deleted, symlink becomes broken

**Examples:**
```bash
ln file.txt link.txt        # Hard link
ln -s file.txt link.txt     # Symbolic link
stat file.txt               # Show inode info
```

### rm - Remove Files

**Purpose:** Delete files

**Syntax:**
```bash
rm [options] files...
```

**Important Options:**
- `-i` - Interactive (ask confirmation)
- `-r` - Recursive (delete directories and contents)
- `-f` - Force (delete write-protected files without confirmation)

**Examples:**
```bash
rm file.txt                 # Delete file
rm -i file.txt              # Ask before deleting
rm -r directory/            # Delete directory and contents
rm -rf directory/           # Force delete without asking
```

**⚠️ WARNING:** `rm -rf /` would delete entire system!

### mkdir - Make Directory

**Purpose:** Create directories

**Syntax:**
```bash
mkdir [options] directory...
```

**Options:**
- `-p` - Create parent directories as needed

**Examples:**
```bash
mkdir newdir                      # Create directory
mkdir ../iset                     # Relative path
mkdir /home/imane/iset/cours      # Absolute path
mkdir -p cours/tp/linux           # Create entire path
```

### rmdir - Remove Directory

**Purpose:** Delete empty directories

**Syntax:**
```bash
rmdir [options] directories...
```

**Options:**
- `-i` - Interactive (ask confirmation)
- `-p` - Remove parent directories too
- `-v` - Verbose (show what's being deleted)

**Examples:**
```bash
rmdir emptydir              # Remove empty directory
rmdir -p path/to/dir        # Remove dir and parent dirs if empty
rmdir -v dir1 dir2          # Verbose removal
```

**Note:** Only works on empty directories. Use `rm -r` for non-empty directories.

### find - Search for Files

**Purpose:** Search files and directories recursively

**Syntax:**
```bash
find [directories] [criteria] [actions]
```

**Three Required Components:**
1. Starting directory (required)
2. Search criteria (optional)
3. Action on found files (required)

**Common Criteria:**

| Criterion | Meaning |
|-----------|---------|
| `-name pattern` | Search by filename (wildcards allowed) |
| `-type f/d/l` | Search by type (f=file, d=directory, l=link) |
| `-user username` | Search by owner |
| `-group groupname` | Search by group |
| `-size +/-n` | Search by size (blocks or c for bytes) |
| `-atime +/-n` | Search by access time |
| `-mtime +/-n` | Search by modification time |
| `-ctime +/-n` | Search by creation time |

**Size/Time Notation:**
- `n` - Exactly n
- `+n` - Greater than n
- `-n` - Less than n

**Logical Operators:**
- `criteria1 criteria2` or `criteria1 -a criteria2` - AND
- `criteria1 -o criteria2` - OR
- `! criteria` - NOT

**Common Actions:**

| Action | Meaning |
|--------|---------|
| `-print` | Display found files (required!) |
| `-exec command {} \;` | Execute command on each found file |
| `-ok command {} \;` | Like -exec but asks confirmation |

**Examples:**
```bash
find . -print                          # List all files recursively
find . -name "*.txt" -print           # Find all .txt files
find . -type f -size 0 -print         # Find empty files
find /home -user john -print          # Find john's files
find . -name "*.log" -mtime +30       # Files older than 30 days
find . -type f -size 0 -exec rm {} \; # Delete empty files
find . -name "*.bak" -ok rm {} \;     # Ask before deleting
```

**Important:** find is recursive - searches all subdirectories automatically!

### grep - Search Text in Files

**Purpose:** Search for text patterns in files

**Syntax:**
```bash
grep [options] pattern [files...]
```

**Common Options:**

| Option | Description |
|--------|-------------|
| `-v` | Display lines NOT containing pattern |
| `-c` | Count lines containing pattern |
| `-n` | Number lines containing pattern |
| `-x` | Exact match (entire line must match) |
| `-l` | Display filenames containing pattern |
| `-i` | Case insensitive search |

**Regular Expression Characters:**

| Character | Meaning |
|-----------|---------|
| `[abc]` | Match one of these characters |
| `[^abc]` | Match any character except these |
| `.` | Match any single character |
| `*` | Zero or more of previous character |
| `+` | One or more of previous character |
| `^pattern` | Pattern at beginning of line |
| `pattern$` | Pattern at end of line |
| `\` | Escape special character |

**Examples:**
```bash
grep "error" log.txt              # Find "error" in file
grep -n "error" *.log             # Show line numbers
grep -i "error" log.txt           # Case insensitive
grep "^ab" file.txt               # Lines starting with "ab"
grep "[0-9]" file.txt             # Lines containing digits
grep -v "comment" code.c          # Lines without "comment"
grep -c "TODO" *.c                # Count TODO occurrences
grep -l "main" *.c                # Files containing "main"
```

**Practical Examples:**
- `^ab` - Lines starting with "ab"
- `[0-9]` - Any digit
- `[adh-lA-Z]` - Letters a, d, h-l (lowercase), or any uppercase
- `[^0-9]` - Any character that's not a digit
- `^\.` - Lines starting with a dot

### sort - Sort File Lines

**Purpose:** Sort lines in files

**Syntax:**
```bash
sort [options] [+pos1 -pos2] [files...]
```

**Position Specification:**
- `+pos1 -pos2` - Sort key starts at field pos1+1, ends at field pos2+1
- `+2 -3` designates field 3
- `+2 -4` designates fields 3 and 4
- If `-pos2` omitted, sorts from pos1 to end of line

**Common Options:**

| Option | Description |
|--------|-------------|
| `-n` | Numeric sort (not lexicographic) |
| `-f` | Ignore case (convert to uppercase before sorting) |
| `-r` | Reverse order (descending) |
| `-t c` | Use character c as field separator |

**Examples:**
```bash
sort file.txt                     # Alphabetical sort
sort -n numbers.txt               # Numeric sort
sort -r file.txt                  # Reverse sort
sort -t: +2 -3 /etc/passwd       # Sort by 3rd field (UID)
sort -n +0 -1 data.txt           # Numeric sort on field 1
```

### wc - Word Count

**Purpose:** Count lines, words, and characters in files

**Syntax:**
```bash
wc [options] [files...]
```

**Options:**
- `-l` - Count lines only
- `-w` - Count words only
- `-c` - Count characters only

**Output Format (default):**
```
lines words characters filename
```

**Examples:**
```bash
wc file.txt                 # All counts
wc -l file.txt              # Line count only
wc -w document.txt          # Word count only
wc -c data.bin              # Character/byte count only
```

### diff - Compare Files

**Purpose:** Show differences between two files

**Syntax:**
```bash
diff file1 file2
```

**Output:** Shows which lines must be changed in file1 to make it identical to file2

**Example:**
```bash
$ diff old.txt new.txt
2c2
< This is old line 2
---
> This is new line 2
```

### cmp - Compare Files (Binary)

**Purpose:** Compare two files byte by byte

**Syntax:**
```bash
cmp [options] file1 file2
```

**Options:**
- `-s` - Silent mode (returns exit code only)

**Return Codes:**
- `0` - Files are identical
- `1` - Files are different
- `2` - Error occurred

**Example:**
```bash
$ cmp file1.txt file2.txt
file1.txt file2.txt differ: byte 45, line 3
```

### tr - Translate Characters

**Purpose:** Transform characters from standard input

**Syntax:**
```bash
tr string1 string2
```

**Behavior:** Characters in string1 are transformed to corresponding characters in string2. Other characters pass through unchanged.

**Examples:**
```bash
tr 'a-z' 'A-Z' < input.txt        # Lowercase to uppercase
tr 'lower' 'UPPER' < file.txt     # Specific character translation
echo "hello" | tr 'a-z' 'A-Z'     # Output: HELLO
```

### head - Display File Beginning

**Purpose:** Extract first lines of file

**Syntax:**
```bash
head [-n] [files...]
```

**Default:** Shows first 10 lines

**Examples:**
```bash
head file.txt               # First 10 lines
head -20 file.txt           # First 20 lines
head -5 *.txt               # First 5 lines of each file
```

### tail - Display File End

**Purpose:** Copy end of file to standard output

**Syntax:**
```bash
tail [position] [files...]
```

**Position Notation:**
- `n` - Starting from line n (from beginning)
- `+n` - Starting from line n (from beginning)
- `-n` - Last n lines (from end)

**Examples:**
```bash
tail file.txt               # Last 10 lines
tail -20 file.txt           # Last 20 lines
tail +50 file.txt           # From line 50 to end
tail -f log.txt             # Follow file (watch new lines)
```

**Useful:** `tail -f` is great for monitoring log files in real-time!

---

## PART 4: PACKAGE MANAGEMENT

### Software Packages

**Overview:**
- Almost all Linux distributions include pre-installed applications
- Distributions have package repositories with vast application collections
- Available for installation via package manager

**Different Package Systems:**
- **DEB packages** - Used by Debian, Ubuntu, Linux Mint
  - Tools: dpkg, apt-get, apt
- **RPM packages** - Used by Red Hat, Fedora, CentOS
  - Tools: rpm, yum, dnf

**Important:** Install packages from appropriate repository designed for your distribution!

### Package Management Basics

**Dependencies:**
- Auxiliary packages needed by programs
- Libraries provide functions used by multiple programs
- Library packaged separately
- All applications depending on it reference this package

**Package Manager Responsibilities:**
- Choose correct packages
- Install required dependencies
- Handle future updates

### Package Installation - DEB Systems

**Search for Packages:**
```bash
apt-cache search packagename
# or
apt search packagename
```

**Example:**
```bash
$ apt-cache search figlet
figlet - Make large character ASCII banners out of ordinary text
```

**Install Package:**
```bash
sudo apt-get install packagename
# or
sudo apt install packagename
```

**Installation Process:**
1. Package is downloaded
2. All dependencies are downloaded and installed
3. Files copied to appropriate locations
4. Additional configuration performed
5. Command becomes available

**Example:**
```bash
$ sudo apt-get install figlet
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
  figlet
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
```

### Package Installation - RPM Systems

**Search for Packages:**
```bash
yum search packagename
# or
dnf search packagename
```

**Example:**
```bash
$ yum search speaking cow
```

**Install Package:**
```bash
sudo yum install packagename
# or
sudo dnf install packagename
```

### Package Removal

**DEB Systems:**
```bash
sudo apt-get remove packagename
# or
sudo apt remove packagename
```

**RPM Systems:**
```bash
sudo yum remove packagename
# or
sudo dnf remove packagename
```

**Example:**
```bash
$ sudo apt-get remove figlet
$ sudo yum remove cowsay
```

**Note:** Configuration files are preserved after removal, so they can be reused if package is reinstalled.

### APT-GET Commands (Debian/Ubuntu)

**Package Sources:**
- Defined in `/etc/apt/sources.list` and `/etc/apt/sources.list.d/`

**Format:**
```
deb http://fr.archive.ubuntu.com/ubuntu edgy main restricted
    [URL]                                [dist] [sections]
```

**⚠️ Warning:** Only use trusted sources! Verify package signatures with `apt-key`.

**Essential Commands:**

| Command | Purpose |
|---------|---------|
| `apt-get update` | Update information from repositories |
| `apt-get upgrade` | Upgrade all installed packages |
| `apt-get install package` | Install package |
| `apt-get remove package` | Remove package |
| `apt-get dist-upgrade` | Upgrade to newer distribution |
| `apt-get check` | Check database status |

### DPKG Commands (Debian Package Manager)

**Purpose:** Manipulate individual .deb package files

| Command | Purpose |
|---------|---------|
| `dpkg -i package.deb` | Install or update package |
| `dpkg -r package` | Remove package |
| `dpkg -P package` | Remove package and configuration |
| `dpkg-reconfigure package` | Reconfigure package |

### TAR, GZIP, BZIP2

**tar - Tape Archive:**
- Creates file containing other files
- Often used with gzip or bzip2 compression

**Create Archives:**
```bash
tar cvf archive.tar files          # Uncompressed
tar cvzf archive.tar.gz files      # gzip compressed
tar cvjf archive.tar.bz2 files     # bzip2 compressed
```

**List Contents:**
```bash
tar tvf archive.tar
tar tvzf archive.tar.gz
tar tvjf archive.tar.bz2
```

**Extract Archives:**
```bash
tar xvf archive.tar
tar xvzf archive.tar.gz
tar xvjf archive.tar.bz2
```

**Flags:**
- `c` - Create
- `x` - Extract
- `t` - List (table of contents)
- `v` - Verbose
- `f` - File
- `z` - gzip compression
- `j` - bzip2 compression

### Installing from Source Code

**When to Compile from Source:**
- Preferred method: Use distribution's package manager
  - Better integration
  - Dependency management
  - Automatic updates
  - Easy uninstallation
- Sometimes necessary: Software not available as package

**Installation Location:**
- Software installed outside package manager should go in `/usr/local`

**Common Build Tools:**
- **autoconf/automake** - Define compilation parameters for platform
- **make** - Automate building binary from sources

### Installing from Source - Method 1

**Standard Process:**

```bash
# 1. Extract sources
tar xvzf soft-1.2.tar.gz

# 2. Configure compilation
cd soft-1.2
./configure

# 3. Compile
make

# 4. Install
sudo make install
```

**Result:** Software installed in various directories under `/usr/local`

**Disadvantage:** No easy uninstallation method

### Installing from Source - Method 2 (Recommended)

**Using checkinstall:**

```bash
# 1. Extract sources
tar xvzf soft-1.2.tar.gz

# 2. Configure
cd soft-1.2
./configure

# 3. Compile
make

# 4. Install with checkinstall
sudo checkinstall
```

**Advantages:**
- After answering questions, checkinstall creates binary package for your distribution
- Installs the package
- Allows easy uninstallation through package manager
- Transforms source software into binary package automatically

### wget Command

**Purpose:** Non-interactive utility to retrieve web content

**Features:**
- Supports HTTP, HTTPS, FTP protocols
- Can download entire websites recursively
- Useful for offline viewing
- Free to use

**Basic Syntax:**
```bash
wget [options] URL
```

**Download Single Page:**
```bash
wget github.com
```

**Download Multiple Files:**
```bash
wget URL1 URL2 URL3
```

**Limit Download Speed:**
```bash
wget --limit-rate=500k https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tgz
```

**Background Download:**
```bash
wget -b https://slack.com/downloads
```

**Other Useful Options:**
- `-c` - Continue partial download
- `-O filename` - Save as specific filename
- `-r` - Recursive download
- `-l depth` - Maximum recursion depth
- `-q` - Quiet mode

### git clone Command

**Purpose:** Clone existing repository to new directory

**Usage:**
- Primarily used to copy existing repository
- Original repository can be on local filesystem or remote machine
- Works across network with supported protocols

**Syntax:**
```bash
git clone URL
```

**Example:**
```bash
git clone https://github.com/username/repository.git
```

### Snap Package Manager

**What is Snap:**
- Packaging and deployment system developed for Linux kernel systems
- Packages called "snaps"
- Tool to use them: snapd
- Works across different Linux distributions

**Universal Compatibility:**
- One snap package works on Ubuntu, Debian, Linux Mint, Fedora, openSUSE, Gentoo, and more
- Developers can distribute applications directly to users

**Install snapd:**
```bash
sudo apt-get install snapd
```

**Install core snap base:**
```bash
sudo snap install core
snap refresh core
```

### Snap Basic Commands

| Command | Purpose |
|---------|---------|
| `snap install SnapName` | Install snap package |
| `snap refresh` | Update all installed snaps |
| `snap find` | List available snaps |
| `snap find searchterm` | Search for specific package |
| `snap remove SnapName` | Remove snap package |
| `snap refresh SnapName` | Update single package |
| `snap refresh SnapName --channel=beta` | Switch to beta version |
| `snap revert SnapName` | Revert if something went wrong |

**Installation Location:** Snaps are installed in `/home/username/snap`

---

## Office Applications

### LibreOffice/OpenOffice

**History:**
- Most used office suite under Linux: OpenOffice.org
- OpenOffice.org was open source version of StarOffice (Sun Microsystems)
- LibreOffice created by Document Foundation (based on same code)
- Both have same basic features
- Compatible with Microsoft Office formats

**Main Applications:**

| Application | Purpose |
|-------------|---------|
| Writer | Text editor (like Word) |
| Calc | Spreadsheet (like Excel) |
| Impress | Presentations (like PowerPoint) |
| Draw | Vector drawing |
| Math | Mathematical formulas |
| Base | Database |

---

## Web Browsers

**Google Chrome:**
- Maintained by Google
- Based on open source Chromium browser
- Chromium can be installed via package manager
- Fully compatible with Chrome

**Mozilla Firefox:**
- Maintained by Mozilla (non-profit organization)
- Origins linked to Netscape (first popular open source web browser)
- Widely used in Linux environments

---

## Multimedia Applications

### Graphics and 3D

**Blender:**
- 3D rendering engine for creating animations
- Can export 3D objects for 3D printing

**GIMP (GNU Image Manipulation Program):**
- Complete image editor
- Comparable to Adobe Photoshop
- Has its own concepts and tools
- Used to create, modify, and save bitmap files (JPEG, PNG, GIF, TIFF, etc.)

**Inkscape:**
- Vector graphics editor
- Similar to Corel Draw or Adobe Illustrator
- Default format: SVG (open standard for vector graphics)
- SVG files can be opened by web browsers
- Useful for web page layouts

### Audio and Video

**Audacity:**
- Audio editor
- Can filter, apply effects, and convert between many audio formats
- Supports MP3, WAV, OGG, FLAC, etc.

**VLC (VideoLAN Client):**
- Most popular video player application
- Plays most video formats
- Alternative: smplayer

**Amarok/Audacious:**
- Music players
- Can manage local audio file collections

### Image Processing

**ImageMagick:**
- Command-line tool for converting and modifying most image file types
- Can create PDFs from image files and vice versa
- Very powerful for batch processing

**Example Commands:**
```bash
convert input.jpg output.png        # Convert format
convert -resize 50% large.jpg small.jpg  # Resize
convert *.jpg combined.pdf          # Create PDF
```

---

## CONCLUSION

This comprehensive course covered:

1. **Operating System Fundamentals**
   - OS structure and functions
   - Unix/Linux architecture

2. **File System Management**
   - File types and organization
   - Partitioning and formatting
   - Linux file systems

3. **User and Permission Management**
   - Users and groups
   - Access rights and permissions
   - Security concepts

4. **Command Line Operations**
   - Text editors (vi, emacs)
   - File manipulation commands
   - Search and text processing

5. **Package Management**
   - Installing and removing software
   - Different package systems
   - Compiling from source

6. **Applications**
   - Office suites
   - Web browsers
   - Multimedia tools

**Next Steps:**
- Practice commands regularly
- Explore system administration topics
- Learn shell scripting
- Study advanced Linux topics

---

**End of Course Material**

For questions and further assistance, contact:  
Professor EL BAZZI Mohamed Salim  
Faculty of Polytechnic Studies, Taroudant
