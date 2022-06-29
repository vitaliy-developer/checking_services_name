#!/bin/bash
# sh /home/user1/checking_services_name/checking_logs_services_1.sh >> /home/user1/checking_services_name/output_correct_error_services_1
ip=/home/user1/checking_services_name/lists/ip_list
us=/home/user1/checking_services_name/lists/us
pass=/home/user1/checking_services_name/lists/pass
TIMESTAMP=`date "+%Y-%m-%d-%H-%M-%S"`
nameServc="name_our_service_1"
workDir="/home/user1/checking_services_name/"

for ipAdr in $(cat $ip)
do
	touch "${workDir}"report_logs_"${nameServc}"_"${TIMESTAMP}".txt
  echo '' >> "${workDir}"report_logs_"${nameServc}"_"${TIMESTAMP}".txt
	echo '#######################' >> "${workDir}"report_logs_"${nameServc}"_"${TIMESTAMP}".txt
  echo 'IP address: ' >> "${workDir}"report_logs_"${nameServc}"_"${TIMESTAMP}".txt
	echo $ipAdr >> "${workDir}"report_logs_"${nameServc}"_"${TIMESTAMP}".txt
	echo '#######################' >> "${workDir}"report_logs_"${nameServc}"_"${TIMESTAMP}".txt
 
for userName in $(cat $us)
do

for password in $(cat $pass)
do

if sshpass -p $password ssh -y $userName@$ipAdr  "ls -lah /home/user2/folder_services_name/seg*/service_name*/logs/" >> "${workDir}"report_logs_"${nameServc}"_"${TIMESTAMP}".txt
#if sshpass -p $password ssh -y $userName@$ipAdr  " ps aux | grep -i services_name* && ls -lah /home/user2/folder_services_name/seg*/service_name*/logs/" >> "${workDir}"report_logs_"${nameServc}"_"${TIMESTAMP}".txt
then
  echo "Logined for "${ipAdr}" successfully" && date
  echo "---------"
else
  echo "Logined for "${ipAdr}" failed" && date
  echo "---------"
fi

done
done
done
mv "${workDir}"report_logs_"${nameServc}"_* "${workDir}"history_logs/
