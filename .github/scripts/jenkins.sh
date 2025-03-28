set +e
          
          
key_path="~/.ssh/id_rsa"
usernames=("ubuntu" "ec2-user" "admin")   
          
ips=($(aws ec2 describe-instances --region ${{ env.AWS_REGION }} --query "Reservations[].Instances[].[PublicIpAddress]" --output text))   
          
package(){
for username in "${usernames[@]}"; do
 
for ip in "${ips[@]}"; do
ssh -o StrictHostKeyChecking=no -i  "$key_path" "$username"@"$ip" "sudo chmod 777 /opt" &> /dev/null

scp -o StrictHostKeyChecking=no -i  "$key_path"  "$1"  "$username"@"$ip":/opt &> /dev/null

ssh -o StrictHostKeyChecking=no -i  "$key_path" "$username"@"$ip" "sudo sh /opt/$1" &> /dev/null                           
done
done
        
}  
          
scripts=("jenkins.sh")
for script in "${scripts[@]}"; do
package "$script"
done

          
          
