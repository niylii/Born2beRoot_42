# Born2beRoot_42
# Born2beroot — Full Project Checklist

## 1. Virtual Machine Setup
- [ ] Choose OS (Debian recommended)
- [ ] Download correct ISO
- [ ] Create VM with proper resources (CPU/RAM/Disk)
- [ ] Enable virtualization settings if needed
- [ ] Install OS successfully
- [ ] Set proper hostname format (login42)

---

## 2. Partitioning & LVM
- [ ] Create `/boot` partition OUTSIDE LVM
- [ ] Create physical volume (PV)
- [ ] Create volume group (VG)
- [ ] Create logical volumes (LV) for:
  - [ ] `/`
  - [ ] `/home`
  - [ ] `/var`
  - [ ] `/tmp`
  - [ ] `/srv`
  - [ ] `swap`
- [ ] Format all volumes
- [ ] Configure mount points in `/etc/fstab`
- [ ] Reboot & verify with `lsblk` + `df -h`

---

## 3. User & Group Management
- [ ] Create main user
- [ ] Create a custom user group
- [ ] Add user to correct groups
- [ ] Verify `/etc/passwd` & `/etc/group` entries
- [ ] Verify access rights with `id` command

---

## 4. Sudo Configuration
- [ ] Install sudo
- [ ] Add user to sudo group
- [ ] Create file in `/etc/sudoers.d/` (NOT editing sudoers directly)
- [ ] Configure:
  - [ ] Logging of sudo commands
  - [ ] Limit commands if required
  - [ ] Custom sudo message
  - [ ] Reduced sudo timeout (optional)
- [ ] Validate using `visudo`

---

## 5. Password Policies
- [ ] Configure `/etc/login.defs`:
  - [ ] Password expiration
  - [ ] Minimum length
  - [ ] Min/max days
- [ ] Configure PAM rules in `/etc/pam.d/common-password`:
  - [ ] Enforce complexity (uppercase, digits, symbols)
  - [ ] Enforce retry limits
  - [ ] Enforce history (remember)
- [ ] Test incorrect + weak passwords to ensure policy works

---

## 6. SSH Configuration
- [ ] Install `openssh-server`
- [ ] Change default SSH port
- [ ] Disable root login
- [ ] Allow only main user
- [ ] Restart service and verify:
  - [ ] Local login
  - [ ] Remote login: `ssh -p <port> user@ip`
- [ ] Check SSH service with `systemctl status ssh`

---

## 7. Firewall Setup  
### Debian → `ufw`  
- [ ] Install UFW
- [ ] Deny all incoming by default
- [ ] Allow SSH port
- [ ] Enable firewall
- [ ] Check rules with:
  - [ ] `ufw status numbered`

### Rocky → `firewalld`
(if applicable)

---

## 8. Monitoring Script
- [ ] Write a bash script printing:
  - [ ] CPU load
  - [ ] RAM usage
  - [ ] Disk usage
  - [ ] Number of active connections
  - [ ] Number of logged-in users
  - [ ] Last reboot
  - [ ] Sudo command count
- [ ] Make script executable
- [ ] Configure cron to run it every 10 minutes
- [ ] Verify cron logs on boot & runtime

---

## 9. System Services & Logs
- [ ] Understand systemd basics
- [ ] Check logs with `journalctl`
- [ ] Verify sudo logs
- [ ] Verify SSH logs
- [ ] Check disk usage regularly

---

## 10. Host & Network
- [ ] Correct hostname format (`login42`)
- [ ] Verify hostname with `hostnamectl`
- [ ] Static or DHCP network configured
- [ ] IP reachable via host machine

---

## 11. Final Verification (Evaluator Checklist)
- [ ] SSH works on the custom port
- [ ] Root login disabled
- [ ] Password policy enforced correctly
- [ ] Sudo logs visible
- [ ] Sudo message appears correctly
- [ ] All partitions mounted correctly
- [ ] `/boot` separate from LVM
- [ ] Firewall only allows SSH
- [ ] Monitoring script prints correct info
- [ ] Cron job runs every 10 min
- [ ] User in correct groups
- [ ] No weak passwords accepted
- [ ] Everything documented in README / report

---

## 12. Documentation (Mandatory)
- [ ] OS explanation
- [ ] LVM explanation
- [ ] Partitioning scheme table
- [ ] Sudo rules explanation
- [ ] Firewall explanation
- [ ] SSH security explanation
- [ ] Password policy explanation
- [ ] Monitoring script documentation
- [ ] All commands used
