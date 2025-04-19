#!/bin/bash 

MOUNT_POINT="/efs"

if [ -d "$MOUNT_POINT" ]; then
    echo "Directory exists"

else
                                                                            
ID=$(cat /etc/os-release | grep -w ID | cut -d "=" -f2 |tr -d '"')

fsid="fs-03f3d8317fd88aed1.efs.ap-south-1.amazonaws.com"

path="/efs"
                                               
function_ubuntu(){   
sudo apt update -y && sudo apt install nfs-common -y

}


function_redhat(){    

sudo yum update -y && sudo yum install nfs-utils -y

}

if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then          

  function_ubuntu


elif [ "$ID" = "rhel" ] || [ "$ID" = "amzn" ]; then   
                                                                   
  function_redhat                                                                               

else

echo "notfound"          


  fi 
  fi


sudo mkdir $MOUNT_POINT

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport $fsid:/ $MOUNT_POINT

echo "$fsid:/ $MOUNT_POINT nfs4 defaults,_netdev 0 0" | sudo tee -a /etc/fstab    






