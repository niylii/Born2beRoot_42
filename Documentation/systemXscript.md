script
└─ report
   ├─ Architecture
   │   └─ This is the system’s “blueprint”: CPU type, kernel version, machine model.
   │      It basically tells you **what kind of computer** you're running on and
   │      what OS kernel it’s using.
   │
   ├─ CPU
   │   ├─ Physical cores
   │   │     These are the **actual hardware cores** inside your processor.
   │   │     They do the real, physical computing work.
   │   └─ Virtual cores (threads)
   │         Created by technologies like Hyper-Threading.
   │         They let a single physical core juggle multiple tasks at once.
   │         More threads = better multitasking.
   │
   ├─ RAM
   │   ├─ Total memory
   │   │     RAM = **temporary fast memory** your programs run in.
   │   ├─ Used memory
   │   │     How much is currently occupied by programs and the OS.
   │   └─ Percentage used
   │         Shows how “full” your RAM is.
   │         Useful to see if your system is struggling.
   │
   ├─ Disk
   │   ├─ Total disk space
   │   │     The size of your **storage drive** (where files live permanently).
   │   ├─ Used space
   │   │     How much of that storage is already occupied.
   │   └─ Percentage used
   │         Helps you see if your system is running out of space.
   │
   ├─ CPU usage %
   │   └─ Measures how busy your processor currently is.
   │      High usage = system working hard.
   │
   ├─ Last reboot
   │   └─ Tells you when the machine last restarted.
   │      Useful for uptime monitoring and system stability.
   │
   ├─ LVM active?
   │   └─ LVM = Logical Volume Management.
   │      It lets you create **flexible partitions** that can grow/shrink easily.
   │      The script checks if the system is using these “fancy disks”.
   │
   ├─ TCP connections
   │   └─ Shows how many network connections are currently active.
   │      Good for spotting network activity or issues.
   │
   ├─ Logged-in users
   │   └─ How many people are currently logged into the machine.
   │      Useful for security and monitoring.
   │
   ├─ Network
   │   ├─ IP address
   │   │     Your machine’s “home address” on the network.
   │   └─ MAC address
   │         The **hardware ID** of your network interface.
   │         Like the fingerprint of your network card.
   │
   └─ Sudo command count
       └─ How many times users executed commands with admin privileges.
          Good for security auditing — who’s been acting like a hacker 
