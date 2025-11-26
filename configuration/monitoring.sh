#!/bin/bash

wall "
	#Architecture: $(uname -a)
	#CPU physical: $(grep "physical id" /proc/cpuinfo | sort -u | wc -l)
	#vCPU: $(grep -c "processor" /proc/cpuinfo)
	#Memory Usage: $(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)", $3,$2,$3*100/$2}')
###	#Disk Usage: $(df -h / | awk 'NR==2{printf "%s/%s (%s)", $3,$2,$5}')
###	#CPU load: $(top -bn1 | grep '^%Cpu' | awk '{printf("%.1f%%"), 100 - $8}')
	#Last boot: $(who -b | awk '{print $3, $4}')
	#LVM use: $(if [ $(lsblk | grep -c "lvm") -gt 0 ]; then echo "yes"; else echo "no"; fi)
	#Connections TCP: $(ss -t | grep -c ESTAB) ESTABLISHED
	#User log: $(users | tr ' ' '\n' | sort -u | wc -w)
	#Network: IP $(hostname -I)($(ip link show | grep "link/ether" | awk '{print $2}'))
	#Sudo: $(journalctl _COMM=sudo | grep -c COMMAND) cmd
"
echo $wall | wall

