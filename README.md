# Born2beRoot

    This project was created as part of the 42 curriculum by nouhiyli

# Description
  In this project, we take our first steps into the world of **virtualization** by creating our very first **virtual machine (VM)**
using VirtualBox (since we’re working in a Linux environment). We also learn what system administration actually feels like without burning
down a real machine, understand the security polices and mandatory access control, firewalls,  partitions, user management, system services ...

## Services installed
* UFW as a firewall.
* SSH mainly for remote access and data transfer.
* cron for scheduled tasks.
* for the bonus part : WordPress + MariaDB + php + lighttpd

## Security Policies
 We set Strict password rules, password expiration, controlled sudo access, mandatory logs, and a monitoring script to supervise system activity.

## User Management
 We made main user, a dedicated sudo group, and tight permissions to prevent unauthorized or accidental actions.

## Partitions:
 The VM uses the LVM (logical volume management) to organize storage for it to be more flexible and resizable later on without crying
My machine has the following partitions : /, /home, /var, /srv, /tmp, /boot, /var/log , swap

## Distribution: Debian vs Rocky
 For this project, I chose the **Debian** distribution because it is lightweight, stable, and beginner-friendly. 
Debian is often used on servers, and it benefits from a large and active community with extensive documentation.  
and the main drawback of Debian is that its package versions tend to be older compared to some other distributions.

 On the other hand, **Rocky Linux** is designed for enterprise environments and is fully compatible with **RHEL
(Red Hat Enterprise Linux)**. It’s heavier than Debian, has a smaller community, and is less beginner-friendly, 
but it excels in stability and compatibility for corporate use.

## Security Models:
 When it comes to Linux security models, each distribution has its own implementation.  
- **Debian** typically uses **AppArmor**, a Mandatory Access Control (MAC) system based on application profiles. 
It defines which files and paths each program can access.  
- **Rocky Linux** uses **SELinux (Security-Enhanced Linux)**, which enforces stricter and more granular access control. 
SELinux manages permissions at every level ... for users, processes, and applications using some complex policies.

## Firewall:
 To protect our server, we need a firewall to control incoming and outgoing network traffic.  
On Debian, we use **UFW (Uncomplicated Firewall)**. It’s not a standalone firewall but a user-friendly front-end
that manages "**netfilter** " the real firewall engine in the Linux kernel.  
By contrast, **firewalld** (commonly used on RHEL-based systems) is a background service that dynamically manages 
and updates firewall rules, acting as a controller for the kernel’s firewall subsystem.

## Hypervisor:
 For virtualization, we usually work with **VirtualBox**, which is cross-platform and works well on Linux, Windows, and sometimes macOS.  
However, for some macOS systems, especially those running on **Apple Silicon**, we use **UTM** instead. 
UTM is a lightweight virtualization tool built on **QEMU**, the actual hypervisor, allowing efficient virtual machine performance on macOS hardware.

# Instructions:
## Installation & VM Setup
1. Create a new Virtual Machine in VirtualBox.
2. Choose a Linux distro (Debian (64-bit)) as the OS type.
3. Allocate RAM and CPU according to the project’s requirements.
4. Attach the Debian ISO and start the installation process.
5. Configure the partitions manually using LVM:
     Create partitions and mount them : /, /home, /var, /srv, /tmp, /boot, and swap. Each partition must follow the sizes and structure recommended in the subject.
6. Complete the Debian installation, set the hostname, create the main user, and install only the required services.
7. enable SSH, adjust its port, and verify that you can log in remotely.
8. Install and configure the firewall (UFW or firewalld depending on the OS).
9. Add the monitoring script to the system and ensure it runs correctly.
and voila you are pretty much done with the mandatory part.

# Resources:
* Debian Handbook
* Rocky Linux Docs
* VirtualBox Documentation
* AppArmor & SELinux official sites
* UFW & firewalld guides
* Random websites and some reddit posts/replies.
## AI Was Usage:
AI helped me with:
- Reformulating explanations in a cleaner and more professional tone.
- Comparing systems and explaining pros/cons.
- Helping me reason through system configuration choices.
