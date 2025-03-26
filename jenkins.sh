
ID=$(cat /etc/os-release | grep -w ID | cut -d "=" -f2 |tr -d '"')   

if jenkins --version &> /dev/null

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

if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then          

  jenkins_ubuntu


elif [ "$ID" = "rhel" ] || [ "$ID" = "amzn" ]; then   
                                                                   
  function_redhat                                                                               

else

echo "notfound"            

fi  

 









sudo systemctl enable jenkins
sudo systemctl start jenkins
