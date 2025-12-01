This document explains the technical words used in the Born2beRoot guide in simple, beginner‑friendly language.​

## 1. Basic concepts

- Server: A computer that provides something to other computers (for example, SSH access, web pages, files).
- Set up a server: Install and configure the OS so the machine can safely provide services to users.
- Service: A background program that listens for requests (for example, SSH, web server, database).
- Minimum of services: Only keep the few background programs that are really needed, to reduce attacks and bugs.
- Operating system (OS): Main software that manages hardware and runs programs (for example, Debian or Rocky Linux).

---

## 2. Graphical interface and X.org

- Graphical interface (GUI): Desktop, windows, icons, mouse, etc. (like GNOME, KDE). Not needed on a small server.
- X.org (X server): The low-level program that draws the graphical interface on screen.
- No GUI allowed: You must keep the system in text mode only; installing X.org or similar gives you 0.

---

## 3. Debian, Rocky, and stability

- Debian: A popular Linux distribution, often used on servers, known for stability.
- Rocky Linux: A Linux distribution compatible with Red Hat Enterprise Linux, also used on servers.
- Latest stable version: Official, tested release, not experimental.
- Testing / unstable: Development branches with newer but less tested packages; not allowed in this project.

---

## 4. SELinux, AppArmor, KDump

- SELinux (Security-Enhanced Linux): Extra security layer that strictly controls what each program can read, write, or execute.
- SELinux running at startup: SELinux must be enabled automatically when the system boots.
- AppArmor: Another security system similar to SELinux, used mainly on Debian; also restricts program actions.
- KDump: Tool that captures a memory dump when the kernel crashes, used for debugging; you do not need to configure it.

---

## 5. Disks, partitions, encryption, LVM

- Disk partition: A “slice” of a disk; one physical disk can be split into multiple logical pieces.
- Encrypted partition: Disk area where data is scrambled and needs a password/key to be read.
- LVM (Logical Volume Management): Flexible way to manage disk space using volume groups and logical volumes that are easy to resize.
- Encrypted partitions using LVM: You combine encryption with LVM so your logical volumes are encrypted.
- Partitioning: The process of deciding how to cut the disk into partitions and volumes and choosing their sizes.

---

## 6. Virtual machine and hostname

- Virtual machine (VM): A “virtual computer” running inside your real computer, created with tools like VirtualBox or UTM.
- Hostname: The name of the machine on the network (for example, `wil42`), shown in the shell prompt and network tools.

---

## 7. SSH and port 4242

- SSH (Secure Shell): Protocol and command used to connect securely to a remote shell over the network.
- SSH service (sshd): Background program that listens for incoming SSH connections.
- Port: Number that identifies a specific service on a machine (e.g., 22 for SSH by default).
- Mandatory port 4242: SSH must listen on port 4242 instead of the default 22.
- No SSH root login: Direct SSH login as root must be disabled; you log in as a normal user and then use `sudo`.

---

## 8. Firewall, UFW, firewalld

- Firewall: Program that filters network traffic and decides which connections are allowed or blocked.
- UFW (Uncomplicated Firewall): Simple command-line tool to manage firewall rules on Debian/Ubuntu-type systems.
- firewalld: Firewall management service used on many Red-Hat-style systems (like Rocky).
- Only port 4242 open: Firewall must block all other incoming ports; only 4242 is allowed for SSH.

---

## 9. Package tools: apt and aptitude

- apt: Standard command-line tool on Debian to install, update, and remove software packages.
- aptitude: Alternative package manager with a text UI; can propose different dependency solutions than apt.

---

## 10. Users, groups, sudo, root

- User: Account on the system with its own name, home directory, and permissions.
- Root user: Super administrator account with full control over the system.
- Group: Collection of users, used to give permissions to many users at once.
- `user42` group: Special group required by the subject; your main user must belong to it.
- `sudo` group: Group whose members can use `sudo` to run commands as root.
- sudo: Command that lets a user run a single command with root privileges after entering their own password.
- sudo configuration (sudoers): Rules that define who can use sudo, for what commands, and with which restrictions.

---

## 11. Password policy

- Password policy: Set of rules that control how passwords are created, changed, and checked.
- Expire every 30 days: Every account must change its password at least once every 30 days.
- Minimum 2 days before change: User must wait at least 2 days before changing the password again.
- 7-day warning: System warns the user 7 days before the password expires.
- Minimum length 10: Password must be at least 10 characters long.
- Uppercase, lowercase, number: Password must include at least one uppercase letter, one lowercase letter, and one digit.
- No more than 3 identical characters in a row: Avoid patterns like `aaaa` or `1111`.
- Password must not contain username: Prevents trivial passwords like `user123` for user `user`.
- At least 7 different characters compared to old password: New password must differ enough from the previous one.
- Policy also for root: Root’s password must follow these rules too.

---

## 12. Sudo security rules

- Authentication attempts limited to 3: After 3 wrong password tries in a single sudo command, sudo stops asking.
- Custom error message: Your own text shown when the user enters a wrong password with sudo.
- Sudo log: File where every sudo command (input and output) is recorded.
- Log directory `/var/log/sudo/`: Folder where the sudo log file must be stored.
- TTY mode: Sudo only works from a real terminal; this protects against some attacks from non-interactive contexts.
- PATH (paths used by sudo): List of directories where the shell looks for programs (`/usr/bin`, `/bin`, etc.).
- Restricted PATH for sudo: Only allow safe directories to be used when running commands with sudo.

---

## 13. Terminals, TTY, wall

- Terminal: Text window where you type commands and see their output.
- TTY: Name for terminal devices in Unix/Linux (e.g., `/dev/tty1`, `/dev/pts/0`).
- `wall` command: Sends a message to all logged-in users’ terminals at once (“write all”).

---

## 14. monitoring.sh and bash

- Script: Text file containing commands executed in order by an interpreter.
- Bash: Common shell (command interpreter) on Linux; you write your script in bash.
- `monitoring.sh`: Bash script you must create to display system information regularly.
- No visible errors: Script output must be clean; no “command not found” or other error messages.

---

## 15. System information for monitoring.sh

- Architecture: CPU type the OS is built for (for example, `x86_64` for 64-bit PCs).
- Kernel: Core part of the operating system that directly manages hardware (Linux kernel).
- Kernel version: Exact version number of the kernel running (for example, `4.19.0-16-amd64`).
- Physical processors: Real CPU cores or chips in the machine.
- Virtual processors (vCPU): Number of CPUs that the virtual machine sees, created by the hypervisor.
- RAM: Main memory used by programs while they run.
- RAM usage (%): Percentage of total RAM currently in use.
- Disk/storage usage: How much disk space is used and how much is free.
- Disk usage (%): Percentage of disk space used.
- CPU load / CPU usage (%): How busy the CPU is at the moment.
- Last boot: Date and time of the last system restart.
- LVM active: Whether LVM is currently in use for managing the disk partitions.
- Active connections: Current network connections (for example, TCP connections in `ESTABLISHED` state).
- Logged-in users: Number of users currently using the server.
- IPv4 address: Network address in IPv4 format (for example, `10.0.2.15`).
- MAC address: Hardware address of the network card (for example, `08:00:27:51:9b:a5`).
- Number of sudo commands: Count of how many commands have been run using sudo.

---

## 16. cron and periodic tasks

- cron: Service that runs commands automatically at scheduled times.
- cron job: A rule that tells cron which command to run and when (for example, every 10 minutes).

---

## 17. Bonus: WordPress, lighttpd, MariaDB, PHP

- WordPress: Web application for building websites and blogs.
- lighttpd: Lightweight web server (alternative to Apache or NGINX).
- MariaDB: Database server compatible with MySQL, used to store website data.
- PHP: Server-side programming language used by WordPress.
- Extra service: Any additional useful service you install (excluding NGINX and Apache2, which are forbidden).
- Open extra ports: Allow additional ports in the firewall (for example, 80 for HTTP) if you add services.

---

## 18. Git, virtual disk, signatures, hashes

- Git repository: Project storage controlled by Git (GitHub/GitLab), where you push your code and documentation.
- Root of the repo: Top-level directory of the Git repository.
- Virtual disk file: File used by the VM to store its disk (for example, `.vdi`, `.qcow2`).
- Signature of virtual disk: Unique hash string calculated from the disk file, used to verify it is the same VM.
- SHA-1 (sha1): Hash algorithm that produces a 40-character hexadecimal string.
- `certUtil`, `sha1sum`, `shasum`: Commands used to calculate SHA-1 hashes on Windows, Linux, and macOS.

---

## 19. Snapshots and save state

- Snapshot: Saved state of a VM (including disk state) that you can roll back to; forbidden in this project.
- Save state: Saves RAM state so you can resume the VM later; not the same as a snapshot, but you may use it.

---
