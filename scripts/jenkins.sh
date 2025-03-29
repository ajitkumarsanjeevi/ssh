#!/bin/bash                                 
           
          set +e

            
          
          

          script="jenkins.sh"
          
          usernames=("ubuntu" "ec2-user" "admin")   
          
          ips=($(aws ec2 describe-instances --region us-east-1 --query "Reservations[].Instances[].[PublicIpAddress]" --output text))   
          
          
          for username in "${usernames[@]}"; do
 
          for ip in "${ips[@]}"; do

          ssh -o StrictHostKeyChecking=no -i  ~/.ssh/id_rsa "$username"@"$ip" "sudo chmod 777 /opt" &> /dev/null 

          scp -o StrictHostKeyChecking=no -i  ~/.ssh/id_rsa  "$script"  "$username"@"$ip":/opt &> /dev/null 

          ssh -o StrictHostKeyChecking=no -i  ~/.ssh/id_rsa "$username"@"$ip" "sudo sh /opt/$script"                         
          
          done
         
          done

