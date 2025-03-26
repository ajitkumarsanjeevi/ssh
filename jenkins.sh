
ID=$(cat /etc/os-release | grep -w ID | cut -d "=" -f2 |tr -d '"')   

if jenkins --version &> /dev/null; then

echo "jenkins installed"

else

echo "installing jenkins"

jenkins_ubuntu(){
sudo apt update -y
sudo apt install fontconfig openjdk-17-jre -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
}  

jenkins_rhel(){
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
sudo yum install fontconfig java-17-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
}


if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then          

  jenkins_ubuntu

elif [ "$ID" = "rhel" ] || [ "$ID" = "amzn" ]; then   
                                                                   
  jenkins_rhel                                                                             

else

echo "notfound"            

fi  

fi 

sudo systemctl enable jenkins
sudo systemctl start jenkins
