#!/bin/bash
sudo yum install -y yum-utils
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo yum install -y git
sudo curl -l https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl enable docker


exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo su --
hostname tomcat-server
amazon-linux-extras install -y java-openjdk11
cd /opt/
wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.49/bin/apache-tomcat-8.5.49.tar.gz
tar -xvzf apache-tomcat-8.5.49.tar.gz
mv apache-tomcat-8.5.49 tomcat
cd /opt/tomcat/bin/
./startup.sh
