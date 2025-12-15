#!/bin/bash
# The script bellow can either use the while loop with the right crontab time configuration or can be run without but again with the right crontab time configuration ...
while true; do 

	#disk usage:
	used=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{used+=$3} END {print used}')
	all=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{all+=$2} END {print int(all / 1024)}')
	per=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{used += $3} {all += $2} END { per= int(used/all * 100); print per}')
 	wall "
		#Architecture: $(uname -a)
		#CPU physical: $(grep "physical id" /proc/cpuinfo | sort -u | wc -l)
		#vCPU: $(grep -c "processor" /proc/cpuinfo)
		#Memory Usage: $(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)", $3,$2,$3*100/$2}')
		#Disk Usage: $used/$all Gb ($per%)
		#CPU load: $(mpstat 1 2 | tail -1 | awk '{printf("%.1f%%"), 100 - $12}')
		#Last boot: $(who -b | awk '{print $3, $4}')
		#LVM use: $(if [ $(lsblk | grep -c "lvm") -gt 0 ]; then echo "yes"; else echo "no"; fi)
		#Connections TCP: $(ss -t | grep -c ESTAB) ESTABLISHED
		#User log: $(users | tr ' ' '\n' | sort -u | wc -w)
		#Network: IP $(hostname -I)($(ip link show | grep "link/ether" | awk '{print $2}'))
		#Sudo: $(journalctl -q _COMM=sudo | grep -c COMMAND) cmd
	"
	sleep 10m
done
