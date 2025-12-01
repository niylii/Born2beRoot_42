## Terminal and lsblk output words

- **Terminal**: Command-line program where you type commands.
- **root**: The superuser (administrator) account in Linux.
- **user@hostname**: Prompt showing current user and machine name.
- **#**: Prompt symbol for the root (administrator) shell.
- **lsblk**: Command “list block devices”; shows disks, partitions, and LVM volumes.
- **NAME**: Column listing device names (sda, sda1, etc.).
- **MAJ:MIN**: Major/minor device numbers used internally by the kernel.
- **RM**: “Removable”; `1` means removable device (like USB), `0` means not removable.
- **SIZE**: Total size of the device or partition.
- **RO**: “Read Only”; `1` means read-only, `0` means writable.
- **TYPE**: Kind of device (disk, `part` = partition, `lvm` = LVM logical volume, `rom`, etc.).
- **MOUNTPOINT**: Directory where the filesystem is attached (`/`, `/home`, `/var`, etc.).
- **sda**: First disk detected by the kernel.
- **sda1, sda2, sda5**: Partitions on `sda` (1, 2, 5 are partition numbers).
- **sda5_crypt / LVs5_crypt**: Encrypted LUKS container partition used by LVM.
- **LVMGroup-root / -swap / -home / -srv / -var / -tmp / -var-log**: Logical volumes inside the LVM group; each one usually mounted on `/`, swap, `/home`, `/srv`, `/var`, `/tmp`, `/var/log`.
- **LVMGroup**: Name of the LVM volume group that aggregates physical volumes.
- **[SWAP]**: Swap area used as extra virtual memory.
- **/**: Root filesystem, top of the directory tree.
- **/boot**: Partition that stores the bootloader and kernel.
- **/home**: Users’ personal directories.
- **/srv**: Service data (for servers like web, FTP).
- **/var**: Variable data (logs, caches, spool, etc.).
- **/tmp**: Temporary files.
- **/var/log**: Log files directory.
- **sr0**: Optical drive device (CD/DVD) if present.

## Bonus web service words

- **Set up a functional WordPress website**: Install and configure WordPress so a site works correctly.
- **lighttpd**: Lightweight web server program.
- **m4**: Macro processor often required when building some software (mentioned in the subject).
- **PHP**: Scripting language executed on the server; used by WordPress.
- **Set up a service of your choice**: Install and configure one extra server/service you pick.
- **NGINX**: Popular high-performance web server
