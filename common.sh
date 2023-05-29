app_user=roboshop
script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

fun_nodejs(){
    echo -e "\e[36m>>>>>Download rpm setup <<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>Install NodeJS<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[36m>>>>>Add Roboshop user<<<<<\e[0m"
useradd app_user

echo -e "\e[36m>>>>>Create App directory<<<<<\e[0m"
mkdir /app 

echo -e "\e[36m>>>>>Download Cart file<<<<<\e[0m"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip 
cd /app 

echo -e "\e[36m>>>>>Unzip cart file<<<<<\e[0m"
unzip /tmp/${component}.zip

echo -e "\e[36m>>>>>Install NPM <<<<<\e[0m"
npm install 

echo -e "\e[36m>>>>>Copy Cart service<<<<<\e[0m"
cp ${script_path}/${component}.service /etc/systemd/system/${component}.service

echo -e "\e[36m>>>>>Cart service Restart<<<<<\e[0m"
systemctl daemon-reload
systemctl enable ${component} 
systemctl start ${component}
}