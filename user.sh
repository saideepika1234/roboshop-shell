echo -e "\e[36m>>>>>Download nodejs source file<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>Install NodeJS<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[36m>>>>>Add roboshop user<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>Create app directory<<<<<\e[0m"
mkdir /app \

echo -e "\e[36m>>>>>Download user file<<<<<\e[0m"
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip 

echo -e "\e[36m>>>>>Unzip user directory<<<<<\e[0m"
cd /app 
unzip /tmp/user.zip

echo -e "\e[36m>>>>>NPM installation<<<<<\e[0m"
npm install 

echo -e "\e[36m>>>>>Create user service<<<<<\e[0m"
cp /home/centos/roboshop-shell/user.service /etc/systemd/system/user.service

echo -e "\e[36m>>>>>start user service<<<<<\e[0m"
systemctl daemon-reload
systemctl enable user 
systemctl start user

echo -e "\e[36m>>>>>Copy mongodb repo<<<<<\e[0m"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>Install Mongodb<<<<<\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[36m>>>>>Load mongodb schema<<<<<\e[0m"
mongo --host mongodb-dev.rsaideepika123.online </app/schema/user.js