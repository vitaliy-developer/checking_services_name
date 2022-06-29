# Bash script to remotely execute commands from a list of IP addresses
This program is for remote checking (of some files or folders) on your servers
This program was created to remotely check logs on N numbers of servers.
If we have different users and passwords, the program substitutes the required user and password for our IP. And it executes the command we need, and writes the output to our project.
* lists/us // here is your list of users
* lists/pass // here is your list of passwords for your users
* lists/ip_list //this is the first IP list
* lists/ip_list2 //this is the second IP list
* output_correct_error_services_1 // output for our services 1
* output_correct_error_services_2 // output for our services 2
* history_logs/report_logs_name_our_service_1_2022-06-28-22-30-01.txt // here is the history of the command execution for the current day
* history_logs/report_logs_name_our_service_2_2022-06-28-22-33-01.txt // here is the history of the command execution for the current day

For convenience, we add our scripts to the crontab:

* 30 22 * * *  sh /home/user1/checking_services_name/checking_logs_services_1.sh >> /home/user1/checking_services_name/output_correct_error_services_1

* 33 22 * * *  sh /home/user1/checking_services_name/checking_logs_services_2.sh >> /home/user1/checking_services_name/output_correct_error_services_2
