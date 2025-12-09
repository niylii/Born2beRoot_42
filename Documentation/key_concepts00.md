This glossary presents the key technical terms from the Born2beRoot project in clear, structured, and professional language, while remaining beginner‑friendly.

***

## 1. Basic concepts

- **Server**
A server is a computer designed to provide services to other machines, such as SSH access, web pages, or file sharing, usually running continuously and remotely administered.
- **Set up a server**
Setting up a server means installing the operating system and configuring services, security, and networking so the machine can safely deliver specific functionalities to users.
- **Service**
A service is a background process that starts at boot and waits for requests, such as `sshd` for SSH or a web server for HTTP.
- **Minimum of services**
Running only the strictly necessary services reduces the attack surface and the risk of misconfigurations or vulnerabilities.
- **Operating system (OS)**
The OS is the core software layer that manages hardware resources and provides the environment in which applications and services run.

***

## 2. Graphical interface and X.org

- **Graphical interface (GUI)**
A GUI is the desktop environment with windows, icons, and mouse interaction; it is convenient for desktop use but unnecessary and heavier on small servers.
- **X.org (X server)**
X.org is the display server responsible for drawing graphical interfaces and handling keyboard and mouse events in traditional Linux desktop setups.
- **No GUI allowed**
For Born2beRoot, the system must operate exclusively in text mode to reflect realistic server environments, so installing X.org or a desktop environment is prohibited.

***

## 3. Debian, Rocky, and stability

- **Debian**
Debian is a widely used Linux distribution recognized for its stability and long-term support, making it a common choice for servers.
- **Rocky Linux**
Rocky Linux is a community-driven, Red Hat Enterprise Linux–compatible distribution, designed to provide enterprise-grade stability and compatibility.
- **Latest stable version**
The latest stable version is the officially supported release focused on reliability and security updates, rather than experimental features.
- **Testing / unstable**
Testing and unstable branches provide more recent software but less validation, making them inappropriate for a strict, stability-focused project.

***

## 4. SELinux, AppArmor, KDump

- **SELinux (Security-Enhanced Linux)**
SELinux enforces mandatory access control policies, finely restricting what each process can read, write, or execute beyond traditional Unix permissions.
- **SELinux running at startup**
When SELinux is used, it must be enabled from boot so the entire system operates under its security policy from the earliest stages.
- **AppArmor**
AppArmor is another mandatory access control system that applies per-application profiles to define which paths and capabilities each program may access.
- **KDump**
KDump captures a memory image when the kernel crashes, allowing detailed post‑mortem analysis but is not required to be configured for this project.

***

## 5. Disks, partitions, encryption, LVM

- **Disk partition**
A partition is a logical subdivision of a physical disk, enabling separation of data and filesystems within a single device.
- **Encrypted partition**
An encrypted partition stores data in a cryptographically protected form, requiring a passphrase or key to make its contents readable.
- **LVM (Logical Volume Management)**
LVM introduces a flexible layer over physical storage (PVs, VGs, LVs), allowing easier resizing, movement, and management of logical volumes compared to fixed partitions.
- **Encrypted partitions using LVM**
A common scheme is to encrypt a single partition, then create LVM structures inside it so all logical volumes benefit from transparent encryption.
- **Partitioning**
Partitioning is the design and creation of the disk layout, deciding which mount points exist (`/`, `/home`, `/var`, etc.) and how much space each receives.

***

## 6. Virtual machine and hostname

- **Virtual machine (VM)**
A VM is a software-emulated computer that runs its own operating system and applications, isolated from the host but using the host’s hardware via a hypervisor like VirtualBox.
- **Hostname**
The hostname is the system’s network name, displayed in prompts and tools, and used to identify the machine in a network context.

***

## 7. SSH and port 4242

- **SSH (Secure Shell)**
SSH is an encrypted protocol for remote command-line access and file transfer, replacing insecure tools that transmit credentials in clear text.
- **SSH service (sshd)**
`sshd` is the daemon that listens for incoming SSH connections, performs authentication, and initiates remote sessions.
- **Port**
A port is a numbered endpoint on a host used to distinguish multiple services on the same IP address.
- **Mandatory port 4242**
Configuring SSH to listen on port 4242 instead of the default 22 demonstrates control over service configuration and reduces exposure to generic automated scans.
- **No SSH root login**
Disabling direct root login forces administrators to connect with a regular user and escalate privileges via `sudo`, increasing traceability and reducing risk.

***

## 8. Firewall, UFW, firewalld

- **Firewall**
A firewall inspects network traffic and applies rules to permit or deny connections, acting as a primary defense layer at the network level.
- **UFW (Uncomplicated Firewall)**
UFW is a simplified front-end for Linux firewall rules on Debian-like systems, offering readable commands to open or close ports.
- **firewalld**
`firewalld` is a dynamic firewall manager commonly used on RHEL-based systems, organizing rules into zones and services.
- **Only port 4242 open**
Allowing only port 4242 for SSH and blocking all other incoming ports enforces the principle of least exposure for the server.
***

## 9. Package tools: apt and aptitude

- **apt**
`apt` is the standard command-line tool on Debian systems for installing, updating, and removing software packages and their dependencies from repositories.
- **aptitude**
`aptitude` is an alternative package manager with both command-line and text-based interfaces, sometimes resolving dependency conflicts differently from `apt`.

***

## 10. Users, groups, sudo, root

- **User**
A user is a system identity with a login name, unique numeric ID, home directory, and associated permissions.
- **Root user**
The root user (UID 0) is the superuser with unrestricted control over the system, capable of modifying any file or configuration.
- **Group**
A group is a collection of users used to assign permissions and access rights collectively rather than individually.
- **user42 group**
The `user42` group is a project-specific group required by the subject, used to demonstrate creation and management of custom groups.
- **sudo group**
Membership in the `sudo` group grants the ability to execute commands as root using `sudo`, implementing controlled privilege escalation.
- **sudo**
`sudo` executes a single command with elevated privileges after the user authenticates with their own password, and it records this action in logs.
- **sudo configuration (sudoers)**
The `sudoers` configuration defines which users may use `sudo`, for which commands, under what conditions, and how logging and environment are handled.

***

## 11. Password policy

- **Password policy**
A password policy specifies rules for password complexity, length, and lifetime to maintain a minimum security level for all accounts.
- **Expire every 30 days**
Requiring password changes at least every 30 days limits how long a compromised password remains valid.
- **Minimum 2 days before change**
Enforcing a minimum interval between changes prevents users from rapidly cycling through passwords to circumvent history rules.
- **7-day warning**
A warning period notifies users before expiration, balancing security requirements with usability.
- **Minimum length 10**
A minimum length of 10 characters significantly increases the effort needed for brute-force attacks.
- **Uppercase, lowercase, number**
Requiring multiple character classes (upper, lower, digits) increases complexity and reduces the effectiveness of simple dictionary attacks.
- **No more than 3 identical characters in a row**
This rule prevents weak sequences and repeated-character patterns that are easy to guess or crack.
- **Password must not contain username**
Forbidding the username inside the password avoids trivial combinations closely tied to the account identity.
- **At least 7 different characters compared to old password**
Enforcing a minimum difference from the previous password ensures that changes are substantive, not cosmetic.
- **Policy also for root**
Applying the same strong policy to root avoids the situation where the most powerful account is protected by a weaker password.

***

## 12. Sudo security rules

- **Authentication attempts limited to 3**
Restricting `sudo` to a small number of password attempts per command reduces brute-force risks on privileged access.
- **Custom error message**
Configuring a custom error message on incorrect `sudo` authentication confirms that `sudo` is under your explicit control and configuration.
- **Sudo log**
The sudo log records each executed privileged command, supporting traceability, auditing, and incident investigation.
- **Log directory `/var/log/sudo/`**
Storing sudo logs under `/var/log/sudo/` centralizes privilege-related events in a dedicated, easily inspectable location.
- **TTY mode**
Requiring a TTY ensures `sudo` is invoked only from an interactive terminal, mitigating some automated or non-interactive attack vectors.
- **PATH used by sudo**
The PATH under `sudo` defines which directories are searched for executables; controlling it avoids executing binaries from untrusted locations.
- **Restricted PATH for sudo**
Limiting `sudo`’s PATH to known safe directories (e.g., `/usr/bin`, `/bin`) prevents attackers from hijacking command names in writable paths.

***

## 13. Terminals, TTY, wall

- **Terminal**
A terminal is a text-based interface where commands are entered and their output is displayed, either on the local console or through an emulator.
- **TTY**
TTY devices represent terminal endpoints such as local consoles and pseudo-terminals used by SSH sessions.
- **wall command**
`wall` sends a broadcast message to all logged-in users’ terminals, useful for administrative notifications such as the monitoring output in this project.

***

## 14. monitoring.sh and bash

- **Script**
A script is a text file containing a sequence of commands executed by an interpreter, used to automate repetitive or complex tasks.
- **Bash**
Bash is a widely used shell and scripting language on Linux, serving as the interpreter for most user shell sessions and many administrative scripts.
- **monitoring.sh**
`monitoring.sh` is the custom bash script required by the subject to periodically collect and display key system metrics (CPU, memory, disk, users, sudo usage).
- **No visible errors**
The script’s output must be free of errors, indicating that all commands exist, paths are correct, and permissions are properly configured.

***

## 15. System information for monitoring.sh

- **Architecture**
Architecture indicates the CPU instruction set (for example, `x86_64`), which determines which binaries and kernels are compatible.
- **Kernel / Kernel version**
The kernel is the core component of the OS; its version identifies the exact release and patch level running on the system.
- **Physical processors / vCPU**
Physical processors are actual CPU cores, while vCPUs are the virtual cores assigned to the VM by the hypervisor.
- **RAM / RAM usage (%)**
RAM is main memory; measuring usage as a percentage helps assess how much capacity is available versus consumed.
- **Disk/storage usage / Disk usage (%)**
Disk usage indicates how much space is used and free on each filesystem, expressed both in absolute terms and as a percentage.
- **CPU load / CPU usage (%)**
CPU load and usage reflect how busy the processor is over time and whether workloads are saturating available capacity.
- **Last boot**
Last boot time shows when the system was last restarted, providing context on uptime and stability.
- **LVM active**
Whether LVM is active indicates if your system is actually using logical volumes rather than only classic partitions.
- **Active connections**
Active network connections reveal which remote hosts and services are currently communicating with the server.
- **Logged-in users**
The count of logged-in users shows how many sessions are open and which accounts are currently active.
- **IPv4 address**
The IPv4 address is the numeric network identifier used by clients to reach your server over the network.
- **MAC address**
The MAC address uniquely identifies the network interface at the data link layer.
- **Number of sudo commands**
Counting executed `sudo` commands provides a basic metric of privileged activity on the system.

***

## 16. cron and periodic tasks

- **cron**
`cron` is a scheduling daemon that executes commands automatically at specified times and intervals.
- **cron job**
A cron job is a configuration entry that defines which command to run and at what schedule, such as executing `monitoring.sh` every 10 minutes.

***

## 17. Bonus: WordPress, lighttpd, MariaDB, PHP

- **WordPress**
WordPress is a widely used content management system written in PHP that relies on a database to store website content and configuration.
- **lighttpd**
Lighttpd is a lightweight, efficient HTTP server suitable for serving dynamic and static content with low resource usage.
- **MariaDB**
MariaDB is an open-source relational database server compatible with MySQL, used to persist WordPress data such as posts and user accounts.
- **PHP**
PHP is a server-side scripting language executed by the web server to generate dynamic responses before sending HTML to the client
- **Extra service / open extra ports**
Any additional service you deploy (excluding NGINX and Apache2) constitutes an extra service, and its corresponding ports must be opened explicitly in the firewall and justified during the defense.

If you want, the next refinement can be to turn this into a defense-ready script: for each section, add “how to show it in the terminal” and “one sentence explaining why it is important for security.”
