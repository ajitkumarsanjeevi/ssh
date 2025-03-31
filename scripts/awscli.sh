#!/bin/bash                                 
           
          set +e 

            
          
          

          
          packages(){
          usernames=("ubuntu" "ec2-user" "admin")   
          
          ips=($(aws ec2 describe-instances --region us-east-1 --query "Reservations[].Instances[].[PublicIpAddress]" --output text))   
          
          
          for username in "${usernames[@]}"; do
 
          for ip in "${ips[@]}"; do

          ssh -o StrictHostKeyChecking=no -i  ~/.ssh/id_rsa "$username"@"$ip" "sudo chmod 777 /opt" &> /dev/null 

          scp -o StrictHostKeyChecking=no -i  ~/.ssh/id_rsa  "$1"  "$username"@"$ip":/opt &> /dev/null 

          ssh -o StrictHostKeyChecking=no -i  ~/.ssh/id_rsa "$username"@"$ip" "sudo bash /opt/$1"                         
          
          done
         
          done
          }

          for script in "${scripts[@]}";do
          packages "$script"
          done
          
