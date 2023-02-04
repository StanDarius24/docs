---
sudo yum update -y 
sudo yum install wget -y 
sudo yum install java-1.8.0-openjdk.x86_64 -y 
sudo mkdir /app && cd /app 
sudo wget [https://download.sonatype.com/nexus/3...]
sudo tar -xvf nexus-3.39.0-01-unix.tar.gz 
sudo mv nexus-3.39.0-01 nexus 
sudo adduser nexus 
sudo chown -R nexus:nexus /app/nexus 
sudo chown -R nexus:nexus /app/sonatype-work 
sudo vi /app/nexus/bin/nexus.rc 
Uncomment run_as_user parameter and set it as following run_as_user="nexus" 
./nexus start 
sudo firewall-cmd --add-port=8081/tcp --permanent
sudo firewall-cmd --reload
---