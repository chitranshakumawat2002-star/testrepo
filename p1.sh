Log_File="$(cat /var/log/syslog)"
#Log_file="/var/log/syslog"
#echo "Loaded: $Log_File"

echo "printing tail"
#echo "$Log_File" | 
tail -n 5 "$Log_File"
<< comment
echo "printing head"
echo "$Log_File" | head -n 5

#head -n 5 var/log/syslog

echo "printing grep"
echo "$Log_File" | grep "error"

#echo "printing grep without pipe"
#grep -m 2 "system" $Log_File


while true; do
    
    Last20=$(tail -n 20 "$Log_File")

    ErrorCount=$(echo "$Last20" | grep -i "System" | wc -l)
    
	if [ "$ErrorCount" -gt 10 ]; then
		echo "Count is bigger"
	else
        	echo "System occurs $ErrorCount times"
	fi
	
	break

    #sleep 5
done
comment
