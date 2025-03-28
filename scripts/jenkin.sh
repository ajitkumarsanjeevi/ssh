
set +e
          
          
key_path="~/.ssh/id_rsa"
usernames=("ubuntu" "ec2-user" "admin")   
          
ips=($(aws ec2 describe-instances --region us-east-1 --query "Reservations[].Instances[].[PublicIpAddress]" --output text))   
          
package(){
for username in "${usernames[@]}"; do
 
for ip in "${ips[@]}"; do
ssh -o StrictHostKeyChecking=no -i  "$key_path" "$username"@"$ip" "sudo chmod 777 /opt" 
scp -o StrictHostKeyChecking=no -i  "$key_path"  "$1"  "$username"@"$ip":/opt 

ssh -o StrictHostKeyChecking=no -i  "$key_path" "$username"@"$ip" "sudo sh /opt/$1"                           
done
done
        
}  
          
scripts=("jenkins.sh")
for script in "${scripts[@]}"; do
package "$script"
done
