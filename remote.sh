#!/bin/bash

usernames=("ubuntu" "ec2-user" "admin")     

ips=("52.66.71.16")

for username in "${usernames[@]}"; do

    for ip in "${ips[@]}"; do


    ssh -o StrictHostKeyChecking=no -i /home/ec2-user/linux.pem "$username"@"$ip" "sudo chmod 777 /opt"    

    scp -o StrictHostKeyChecking=no -i /home/ec2-user/linux.pem file.sh  "$username"@"$ip":/opt

    ssh -o StrictHostKeyChecking=no -i /home/ec2-user/linux.pem "$username"@"$ip" "sudo bash /opt/file.sh"                          

   done

done
