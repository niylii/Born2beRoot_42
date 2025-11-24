# Born2beroot Evaluation Guide - 42 Network Project

### Basic functioning of virtual machine
A virtual machine (VM) is a software emulation of a physical computer that runs an operating system and applications isolated from the host system. It uses virtualization technology to share hardware resources while maintaining complete separation.

### Choice of OS (Debian vs Rocky)

**Debian:**
- Community-driven
- Very stable
- Large package repository
- Uses APT package manager
- Great for learning and general-purpose servers

**Rocky:**
- Enterprise-focused
- RHEL-compatible (Red Hat Enterprise Linux)
- Uses DNF package manager
- Focuses on server stability and long-term support
- Suitable for business environments

### Benefits of virtual machines
- **Isolation and security**: Each VM is isolated from the host and other VMs
- **Easy backup and snapshot capabilities**: Save VM states and restore them
- **Resource efficiency**: Multiple VMs on one physical machine
- **Testing environments without hardware costs**: Test different configurations safely
- **Easy migration between physical hosts**: Move VMs between servers

### For Debian Users

**APT vs Aptitude:**
- **APT**: Lower-level package management command-line tool, faster and simpler
- **Aptitude**: Higher-level interface with better dependency resolution, has an interactive UI, suggests solutions for conflicts

**AppArmor:**
- Mandatory Access Control (MAC) security system
- Restricts programs' capabilities using per-program profiles
- Confines applications to a limited set of resources
- Easier to use than SELinux

### For Rocky Users

**SELinux (Security-Enhanced Linux):**
- MAC security mechanism providing fine-grained access control
- Labels all system resources (files, processes, ports)
- Enforces security policies
- Three modes: Enforcing, Permissive, Disabled

**DNF (Dandified YUM):**
- Next-generation package manager replacing YUM
- Better performance and dependency resolution
- Modern Python 3 codebase
- Improved command-line interface

---

## Simple Configuration

### Commands to verify

#### Check no GUI at startup
```bash
systemctl get-default
# Should show: multi-user.target (not graphical.target)
```

#### Check UFW/Firewalld status
```bash
# For Debian
sudo ufw status

# For Rocky
sudo firewall-cmd --state
```

#### Check SSH status
```bash
# For Debian
sudo systemctl status ssh

# For Rocky
sudo systemctl status sshd
```

---

## User Management

### Commands to execute

#### Check user exists and groups
```bash
# Check if user exists
getent passwd your_login

# Check user groups (should show sudo and user42)
groups your_login

# Alternative: check group file
getent group sudo
getent group user42
```

#### Create new user
```bash
sudo adduser evaluator_user
# Follow prompts to set password
```

#### Create group and add user
```bash
# Create the evaluating group
sudo groupadd evaluating

# Add user to the group
sudo usermod -aG evaluating evaluator_user

# Verify group membership
groups evaluator_user
id evaluator_user
```

### Password Policy Configuration

#### Files modified for password policy

**1. `/etc/login.defs`**
Password aging controls:
```bash
PASS_MAX_DAYS   30
PASS_MIN_DAYS   2
PASS_WARN_AGE   7
```

**2. `/etc/pam.d/common-password` (Debian) or `/etc/pam.d/system-auth` (Rocky)**
Password quality requirements using pam_pwquality:
```bash
password requisite pam_pwquality.so retry=3 minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root
```

#### View current password policy
```bash
# Check login.defs
sudo cat /etc/login.defs | grep PASS

# Check PAM configuration
sudo cat /etc/pam.d/common-password | grep pam_pwquality
```

### Password Policy Requirements

- Password expires every 30 days
- Minimum 2 days before password can be modified again
- Warning 7 days before password expiration
- Password must be at least 10 characters long
- Must contain at least one uppercase letter
- Must contain at least one lowercase letter
- Must contain at least one digit
- Maximum 3 consecutive identical characters
- Must not contain the username
- Must have at least 7 characters different from the old password
- Root password must follow the same rules

### Password Policy - Advantages and Disadvantages

**Advantages:**
- Enhanced security through strong password requirements
- Forces regular password updates to limit exposure from compromised passwords
- Prevents weak, easily guessable passwords
- Reduces risk of brute force attacks
- Compliance with security standards

**Disadvantages:**
- User frustration with complex requirements
- Potential for users to write down passwords
- Increased support overhead for password resets
- Users may create predictable patterns (Password1, Password2, etc.)
- Can lead to account lockouts

---

## Hostname and Partitions

### Hostname Commands

#### Check current hostname
```bash
hostnamectl
# Or simply
hostname
```

#### Change hostname
```bash
# Method 1: Using hostnamectl
sudo hostnamectl set-hostname new_hostname

# Method 2: Edit configuration files
sudo nano /etc/hostname
# Change the hostname in the file

# Also update /etc/hosts
sudo nano /etc/hosts
# Change old hostname to new hostname

# Reboot to apply changes
sudo reboot
```

#### Restore original hostname
After evaluation, change it back:
```bash
sudo hostnamectl set-hostname your_login42
sudo reboot
```

### Partition Commands

#### Display partitions
```bash
# Best view with LVM info
lsblk

# Detailed partition information
sudo fdisk -l

# LVM-specific information
sudo lvdisplay
sudo vgdisplay
sudo pvdisplay

# Disk usage
df -h
```

### LVM (Logical Volume Manager) Explanation

**What is LVM?**
LVM is a device mapper that provides logical volume management for the Linux kernel. It creates an abstraction layer between the physical storage and the filesystem.

**Components:**
- **Physical Volumes (PV)**: Physical disks or partitions
- **Volume Groups (VG)**: Pool of storage from one or more PVs
- **Logical Volumes (LV)**: Virtual partitions created from VG space

**Benefits of LVM:**
- **Flexible resizing**: Resize partitions without downtime or data loss
- **Snapshots**: Create point-in-time copies for backups
- **Spanning**: Combine multiple physical disks into one logical volume
- **Easy migration**: Move data between physical volumes
- **Better disk management**: Add/remove disks without system downtime
- **Striping and mirroring**: Performance and redundancy options

**Example partition structure for Born2beroot:**
```
sda                     8:0    0   30G  0 disk
├─sda1                  8:1    0  487M  0 part  /boot
├─sda2                  8:2    0    1K  0 part
└─sda5                  8:5    0 29.5G  0 part
  └─sda5_crypt        254:0    0 29.5G  0 crypt
    ├─LVMGroup-root   254:1    0  2.8G  0 lvm   /
    ├─LVMGroup-swap   254:2    0  1.5G  0 lvm   [SWAP]
    ├─LVMGroup-home   254:3    0  3.8G  0 lvm   /home
    ├─LVMGroup-var    254:4    0  2.8G  0 lvm   /var
    ├─LVMGroup-srv    254:5    0  2.8G  0 lvm   /srv
    ├─LVMGroup-tmp    254:6    0  2.8G  0 lvm   /tmp
    └─LVMGroup-var--log 254:7  0  4.2G  0 lvm   /var/log
```

---

## SUDO

### Verify SUDO Installation

```bash
# Check if sudo is installed
which sudo
dpkg -l | grep sudo       # Debian
rpm -qa | grep sudo       # Rocky

# Check sudo version
sudo --version
```

### Add User to SUDO Group

```bash
# Debian
sudo usermod -aG sudo username

# Rocky
sudo usermod -aG wheel username

# Verify
groups username
```

### SUDO Purpose and Operation

**What is SUDO?**
- "SuperUser DO" - allows permitted users to execute commands as root or another user
- Provides detailed logging of all commands
- Configurable per-user and per-command permissions
- More secure than sharing root password

**Examples of SUDO usage:**
```bash
# Update system packages
sudo apt update

# Edit system files
sudo nano /etc/hosts

# Restart services
sudo systemctl restart ssh

# View system logs
sudo cat /var/log/syslog

# Switch to root
sudo su -
```

### SUDO Configuration Rules

Configuration file: `/etc/sudoers` or files in `/etc/sudoers.d/`

**Subject requirements:**
```bash
# Edit sudo configuration
sudo visudo -f /etc/sudoers.d/sudo_config
```

**Required rules:**
```
Defaults  passwd_tries=3
Defaults  badpass_message="Wrong password. Try again!"
Defaults  logfile="/var/log/sudo/sudo.log"
Defaults  log_input,log_output
Defaults  iolog_dir="/var/log/sudo"
Defaults  requiretty
Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

**Explanation of each rule:**
- `passwd_tries=3`: Limit password attempts to 3
- `badpass_message`: Custom error message for wrong password
- `logfile`: Log all sudo commands to specified file
- `log_input,log_output`: Log both input and output of commands
- `iolog_dir`: Directory for input/output logs
- `requiretty`: Require a TTY (prevents sudo in scripts)
- `secure_path`: Restricted PATH for security

### Check SUDO Logs

```bash
# Check if log directory exists
sudo ls -la /var/log/sudo/

# View sudo log file
sudo cat /var/log/sudo/sudo.log

# View input/output logs
sudo ls -la /var/log/sudo/00/00/
sudo cat /var/log/sudo/00/00/01

# Test: Run a command with sudo
sudo apt update

# Verify log was updated
sudo cat /var/log/sudo/sudo.log
```

---

## UFW/Firewalld

### For Debian (UFW)

#### Verify UFW Installation and Status
```bash
# Check if installed
which ufw
dpkg -l | grep ufw

# Check status
sudo ufw status verbose
```

#### UFW Commands
```bash
# List rules with numbers
sudo ufw status numbered

# Add rule for port 8080
sudo ufw allow 8080

# Verify rule was added
sudo ufw status numbered

# Delete rule (by number)
sudo ufw delete [number]

# Or delete by specification
sudo ufw delete allow 8080

# Other useful commands
sudo ufw enable
sudo ufw disable
sudo ufw reload
```

### For Rocky (Firewalld)

#### Verify Firewalld Installation and Status
```bash
# Check if installed
which firewall-cmd
rpm -qa | grep firewalld

# Check status
sudo firewall-cmd --state
sudo systemctl status firewalld
```

#### Firewalld Commands
```bash
# List all rules
sudo firewall-cmd --list-all

# Add rule for port 8080
sudo firewall-cmd --add-port=8080/tcp --permanent

# Reload to apply changes
sudo firewall-cmd --reload

# Verify rule was added
sudo firewall-cmd --list-ports

# Delete rule
sudo firewall-cmd --remove-port=8080/tcp --permanent
sudo firewall-cmd --reload

# Other useful commands
sudo firewall-cmd --list-services
sudo firewall-cmd --get-active-zones
```

### Firewall Explanation

**What is a Firewall?**
A firewall is a network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules.

**Why use UFW/Firewalld?**
- **Protection**: Blocks unauthorized access attempts
- **Control**: Defines which services are accessible
- **Logging**: Tracks connection attempts
- **Simplicity**: Easy-to-use interface for iptables
- **Default deny**: Only explicitly allowed connections are permitted

**How it works:**
- Examines each network packet
- Compares against defined rules
- Allows or blocks based on rules
- Can filter by port, protocol, IP address, etc.

---

## SSH

### Verify SSH Installation

```bash
# Check if SSH is installed
which ssh
which sshd
dpkg -l | grep openssh-server    # Debian
rpm -qa | grep openssh-server    # Rocky

# Check SSH service status
sudo systemctl status ssh         # Debian
sudo systemctl status sshd        # Rocky
```

### SSH Configuration

#### Check port configuration
```bash
# View SSH configuration
sudo cat /etc/ssh/sshd_config | grep Port
# Should show: Port 4242

# Check if SSH is listening on port 4242
sudo ss -tunlp | grep 4242
# Or
sudo netstat -tunlp | grep 4242
```

#### Verify Root Login is Disabled
```bash
sudo cat /etc/ssh/sshd_config | grep PermitRootLogin
# Should show: PermitRootLogin no
```

### Connect via SSH

#### From Host Machine
```bash
# Using password
ssh new_user@localhost -p 4242
# Or with VM IP
ssh new_user@192.168.x.x -p 4242

# Using SSH key (if configured)
ssh -i ~/.ssh/id_rsa new_user@localhost -p 4242
```

#### Test that Root Cannot Login
```bash
# This should be denied
ssh root@localhost -p 4242
# Should get: Permission denied
```

### SSH Explanation

**What is SSH?**
- Secure Shell protocol for encrypted remote access
- Replaces insecure protocols like Telnet, rlogin, rsh
- Uses public-key cryptography
- Default port is 22 (changed to 4242 for security)

**Why use SSH?**
- **Encryption**: All data is encrypted during transmission
- **Authentication**: Strong authentication methods (passwords, keys)
- **Integrity**: Ensures data hasn't been tampered with
- **Port forwarding**: Secure tunneling for other protocols
- **Remote management**: Securely manage servers from anywhere

**How SSH works:**
1. Client initiates connection to server
2. Server sends its public key
3. Client and server negotiate encryption
4. User authenticates (password or key)
5. Encrypted session established

---

## Script Monitoring

### Script Location and Content

Typical location: `/usr/local/bin/monitoring.sh`

#### Example Monitoring Script
```bash
#!/bin/bash

# Architecture
arch=$(uname -a)

# CPU Physical
cpuf=$(grep "physical id" /proc/cpuinfo | wc -l)

# vCPU
cpuv=$(grep "processor" /proc/cpuinfo | wc -l)

# Memory Usage
ram_total=$(free -m | awk 'NR==2{print $2}')
ram_used=$(free -m | awk 'NR==2{print $3}')
ram_percent=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2}')

# Disk Usage
disk_total=$(df -h --total | grep total | awk '{print $2}')
disk_used=$(df -h --total | grep total | awk '{print $3}')
disk_percent=$(df -h --total | grep total | awk '{print $5}')

# CPU Load
cpu_load=$(top -bn1 | grep '^%Cpu' | awk '{printf "%.1f%%", $2 + $4}')

# Last Boot
last_boot=$(who -b | awk '{print $3, $4}')

# LVM Use
lvm_use=$(lsblk | grep lvm | wc -l)
lvm=$(if [ $lvm_use -eq 0 ]; then echo no; else echo yes; fi)

# TCP Connections
tcp=$(ss -t | grep ESTAB | wc -l)

# User Log
user_log=$(who | wc -l)

# Network
ip=$(hostname -I | awk '{print $1}')
mac=$(ip link | grep ether | awk '{print $2}')

# Sudo
sudo_cmd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

# Display
wall "	#Architecture: $arch
	#CPU physical: $cpuf
	#vCPU: $cpuv
	#Memory Usage: $ram_used/${ram_total}MB ($ram_percent%)
	#Disk Usage: $disk_used/${disk_total} ($disk_percent)
	#CPU load: $cpu_load
	#Last boot: $last_boot
	#LVM use: $lvm
	#Connections TCP: $tcp ESTABLISHED
	#User log: $user_log
	#Network: IP $ip ($mac)
	#Sudo: $sudo_cmd cmd"
```

### Make Script Executable
```bash
sudo chmod +x /usr/local/bin/monitoring.sh
```

### Cron Explanation

**What is Cron?**
- Time-based job scheduler in Unix-like operating systems
- Runs commands or scripts at specified intervals
- Daemon process that runs in the background
- Uses crontab (cron table) for configuration

**Cron time format:**
```
* * * * * command
│ │ │ │ │
│ │ │ │ └─── Day of week (0-7, 0 and 7 are Sunday)
│ │ │ └───── Month (1-12)
│ │ └─────── Day of month (1-31)
│ └───────── Hour (0-23)
└─────────── Minute (0-59)
```

### Configure Cron

#### Edit Crontab
```bash
# Edit root's crontab
sudo crontab -e
```

#### Run Script Every 10 Minutes
```bash
*/10 * * * * /usr/local/bin/monitoring.sh
```

#### Run Script Every 1 Minute (for testing)
```bash
*/1 * * * * /usr/local/bin/monitoring.sh
```

#### Run Script at Startup
```bash
@reboot /usr/local/bin/monitoring.sh
```

#### View Current Crontab
```bash
sudo crontab -l
```

### Stop Script at Startup

**Method 1: Comment out @reboot line**
```bash
sudo crontab -e
# Comment the line:
# @reboot /usr/local/bin/monitoring.sh
```

**Method 2: Remove @reboot line entirely**
```bash
sudo crontab -e
# Delete the @reboot line completely
```

**Verify script doesn't run at startup:**
1. Make the change
2. Reboot: `sudo reboot`
3. After reboot, check that script didn't run
4. Script should still exist at `/usr/local/bin/monitoring.sh`
5. Permissions should be unchanged
6. Script content should be unmodified

### Useful Cron Commands
```bash
# Check cron service status
sudo systemctl status cron       # Debian
sudo systemctl status crond      # Rocky

# Restart cron service
sudo systemctl restart cron      # Debian
sudo systemctl restart crond     # Rocky

# View cron logs
sudo tail -f /var/log/syslog | grep CRON    # Debian
sudo tail -f /var/log/cron                  # Rocky
```

---

## Quick Verification Checklist

### Pre-Defense Checklist
- [ ] `signature.txt` file exists at repository root
- [ ] Signature in `signature.txt` matches `.vdi` file signature
- [ ] Virtual machine boots without GUI
- [ ] Password required at login

### User & Groups
- [ ] User with evaluator's login exists
- [ ] User belongs to `sudo` group
- [ ] User belongs to `user42` group
- [ ] Password policy is enforced

### System Configuration
- [ ] Hostname format is `login42`
- [ ] Can change hostname and it persists after reboot
- [ ] LVM partitions are properly configured
- [ ] Partition structure matches subject requirements

### Services
- [ ] UFW/Firewalld is installed and running
- [ ] UFW/Firewalld has rule for port 4242
- [ ] Can add and remove firewall rules
- [ ] SSH is installed and running
- [ ] SSH uses only port 4242
- [ ] Root login via SSH is disabled
- [ ] Can connect via SSH with non-root user

### SUDO
- [ ] SUDO is installed
- [ ] SUDO configuration follows subject rules
- [ ] `/var/log/sudo/` directory exists
- [ ] SUDO commands are logged
- [ ] Can view and verify sudo logs

### Monitoring Script
- [ ] Script exists and is executable
- [ ] Script displays all required information
- [ ] Script runs every 10 minutes via cron
- [ ] Can modify cron to run every 1 minute
- [ ] Can disable script at startup
- [ ] Script, location, and permissions unchanged after reboot

### Commands Quick Reference
```bash
# System
uname -a
hostnamectl
lsblk

# Users & Groups
getent passwd username
groups username
sudo adduser newuser
sudo groupadd groupname
sudo usermod -aG groupname username

# Services
sudo systemctl status service_name
sudo systemctl restart service_name

# Firewall
sudo ufw status numbered
sudo firewall-cmd --list-all

# SSH
sudo systemctl status sshd
ssh user@host -p 4242

# SUDO
sudo visudo
sudo cat /var/log/sudo/sudo.log

# Cron
sudo crontab -e
sudo crontab -l
```

---

## Bonus Section

### Partition Setup (2 points)
- Verify correct bonus partition structure
- Check all required partitions are present
- Verify encryption is implemented

### WordPress Setup (2 points)
Services allowed: lighttpd, MariaDB, PHP

**Verify:**
```bash
# Check services are running
sudo systemctl status lighttpd
sudo systemctl status mariadb

# Check PHP
php -v

# Access WordPress
# Open browser and navigate to server IP
```

**Services NOT allowed:**
- NGINX
- Apache2

### Free Choice Service (1 point)
Example services:
- FTP server
- Additional monitoring tools
- Fail2ban
- Custom service

**For evaluation:**
- Explain what the service does
- Explain why you chose it
- Demonstrate that it works
- Show how to configure it

---

## Additional Tips for Evaluation

### Stay Calm
- Take your time to explain
- If you forget something, use `--help` or `man` pages
- The evaluator can help you verify points

### Know Your Commands
Practice these before evaluation:
```bash
man sudo
man ssh
man ufw
man cron
--help flag for most commands
```

### Be Ready to Explain
- Why you made certain choices
- How each component works
- Security implications
- Advantages and disadvantages

### Common Issues
- Forgot password: Have recovery plan
- Service not running: Know how to start it
- Can't connect via SSH: Check firewall and SSH config
- Script not working: Verify permissions and cron

---
