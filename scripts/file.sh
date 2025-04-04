 - name: script
        run: |
           set +e
          
          
            key_path="~/.ssh/id_rsa"
            script="file.sh"
          
          
            
            usernames=("ubuntu" "ec2-user" "admin")   
          
            ips=($(aws ec2 describe-instances --region ${{ env.Region }} --query "Reservations[].Instances[].[PublicIpAddress]" --output text))   
          
          
             for username in "${usernames[@]}"; do
 
             for ip in "${ips[@]}"; do

             
             ssh -o StrictHostKeyChecking=no -i  "$key_path" "$username"@"$ip" "sudo chmod 777 /opt/" &> /dev/null

             scp -o StrictHostKeyChecking=no -i  "$key_path"  "$script" "$username"@"$ip":/opt &> /dev/null
              
             ssh -o StrictHostKeyChecking=no -i  "$key_path" "$username"@"$ip" "sudo bash /opt/$script" &> /dev/null

             

