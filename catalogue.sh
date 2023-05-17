echo -e "\e[36m>>>>>Configuring NodeJS repos<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>Install NodeJS<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[36m>>>>>Create Application Directory<<<<<\e[0m"
useradd roboshop
rm -rf /app
mkdir /app 

echo -e "\e[36m>>>>>Downlaod App Content<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 

echo -e "\e[36m>>>>>Unzip App content<<<<<\e[0m"
unzip /tmp/catalogue.zip

echo -e "\e[36m>>>>>Install Nodejs Dependencies<<<<<\e[0m"
npm install 

echo -e "\e[36m>>>>>Copy catalogue system file <<<<<\e[0m"
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[36m>>>>>Start catalogue system<<<<<\e[0m"
systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue

echo -e "\e[36m>>>>>Copy MongoDB repo <<<<<\e[0m"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>Install MongoDB client<<<<<\e[0m"
yum install mongodb-org-shell -y
mongo --host mongodb-dev.rsaideepika123.online </app/schema/catalogue.js