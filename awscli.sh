


curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
ID=$(cat /etc/os-release | grep -w ID | cut -d "=" -f2 |tr -d '"')

                                               
function_ubuntu(){   
sudo apt update -y && sudo apt-get install unzip -y

}


function_redhat(){    

sudo yum update -y && sudo yum install unzip -y

}

if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then          

  function_ubuntu


elif [ "$ID" = "rhel" ] || [ "$ID" = "amzn" ]; then   
                                                                   
  function_redhat                                                                               

else

echo "notfound"          


  fi 

  fi
  
unzip awscliv2.zip 
sudo ./aws/install 


  
