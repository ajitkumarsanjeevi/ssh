#!/bin/bash 
                                                                            
  
ID=$(cat /etc/os-release | grep -w ID | cut -d "=" -f2 |tr -d '"') 
                                               
function_ubuntu(){   

sudo apt update -y
sudo apt install nfs-common -y

}


function_redhat(){    

sudo yum update -y
sudo yum install nfs-utils -y

}

if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then          

  function_ubuntu


elif [ "$ID" = "rhel" ] || [ "$ID" = "amzn" ]; then   
                                                                   
  function_redhat                                                                               

else

echo "notfound"          


  fi 

sudo mkdir /opt/efs

sudo mount

echo "your text here" | sudo tee -a /etc/fstab





