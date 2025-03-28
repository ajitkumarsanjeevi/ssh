#!/bin/bash
set +e
          
          
key_path="~/.ssh/id_rsa"
usernames=("ubuntu" "ec2-user" "admin")   
          
ips=($(aws ec2 describe-instances --region us-east-1 --query "Reservations[].Instances[].[PublicIpAddress]" --output text))   
          
package(){
for username in "${usernames[@]}"; do
 
for ip in "${ips[@]}"; do
ssh -o StrictHostKeyChecking=no -i  "$key_path" "$username"@"$ip" "sudo chmod 777 /opt" 
scp -o StrictHostKeyChecking=no -i  "$key_path"  "$1"  "$username"@"$ip":/opt 

ssh -o StrictHostKeyChecking=no -i  "$key_path" "$username"@"$ip" "sudo bash /opt/$1"                           
done
done
        
}  
          
my_var="jenkis.sh"

# Using case to check the value of my_var
case $my_var in
    "jenkins")
        package Jenkins.sh
       ;;
    
   "awscli")
        echo "This is a banana."
        ;;
    
     "cherry")
        echo "This is a cherry."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac

