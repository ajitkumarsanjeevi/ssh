#!/bin/bash 
                                                                            
  
ID=$(cat /etc/os-release | grep -w ID | cut -d "=" -f2 |tr -d '"') 
path=/efs
fsid=fs-008840d13b2ae3890.efs.us-east-1.amazonaws.com
                                               
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

sudo mkdir $path

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport $fsid:/ $path

echo "$fsid:/ $path nfs4 defaults,_netdev 0 0" | sudo tee -a /etc/fstab    





