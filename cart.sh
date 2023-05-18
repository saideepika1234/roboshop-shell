echo -e "\e[36m>>>>>Download rpm setup <<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>Install NodeJS<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[36m>>>>>Add Roboshop user<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>Create App directory<<<<<\e[0m"
mkdir /app 

echo -e "\e[36m>>>>>Download Cart file<<<<<\e[0m"
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip 
cd /app 

echo -e "\e[36m>>>>>Unzip cart file<<<<<\e[0m"
unzip /tmp/cart.zip

echo -e "\e[36m>>>>>Install NPM <<<<<\e[0m"
npm install 

echo -e "\e[36m>>>>>Copy Cart service<<<<<\e[0m"
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service

echo -e "\e[36m>>>>>Cart service Restart<<<<<\e[0m"
systemctl daemon-reload
systemctl enable cart 
systemctl start cart
