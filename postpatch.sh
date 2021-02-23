 #!/bin/bash

 for options in $(echo $@)

 do
   SERVERLIST=$options
 done

 if [ ! -s "$SERVERLIST" ]
 then
 echo "ERROR: $SERVERLIST does not exist"
 exit 1
 fi
  
for i in $(cat $SERVERLIST)
do
  echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  echo $i
  rosh -l root -n $i -t 'cat /etc/redhat-release;uname -r;date;uptime'
  echo Available Scripts
  rosh -l root -n $i -t 'ls -la /bbtscripts/unix/validate_*;ls -la /bbtscripts/web/validate_*'
  echo Number of mounts
  rosh -l root -n $i -t 'df -Ph|wc -l'
  echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
done




