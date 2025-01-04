#!:/bin/bash


#getting the public ip address
PUBIP=$(curl ifconfig.io 2>/dev/null)
        echo "Your external ip address is: $PUBIP"
		echo 

#getting the private ip address
PRIVIP=$(route | grep default | awk '{print $2}')
        echo "Your network's internal ip address is: $PRIVIP"
        echo
#getting the mac address of the device
MACADD=$(ifconfig | grep ether | awk '{print $2}')


		echo "The mac address of your device is: $MACADD"
        echo
#getting the 5 processes with the highest cpu usage

        echo 'The 15 processes with the highest cpu usage are:'
		ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 15
        echo 




#getting the total and available memory
TOTALMEM=$(free -h | grep Mem |  awk '{print $2}')
        echo "Total memory: $TOTALMEM"

AVAILMEM=$(free -h | grep Mem |  awk '{print $7}')
        echo "Available memory: $AVAILMEM"
        echo


#getting the active running services within the vm
        echo 'Here is the list of active system services within your machine'
        sudo service --status-all | grep +
        echo


#getting the top 10 files in /home

        echo 'The 10 largest files within /home directory are'
		sudo find /home -type f -printf "%s\t%p\n" | sort -n -r | head -10 | awk '{print $(2)}'

