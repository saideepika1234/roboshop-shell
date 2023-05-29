app_user=roboshop
script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

echo -e "\e[36m>>>>>Install Maven repositories<<<<<\e[0m"
yum install maven -y

echo -e "\e[36m>>>>>Add Roboshop user<<<<<\e[0m"
useradd $app_user

echo -e "\e[36m>>>>>Create App directory<<<<<\e[0m"
rm -rf /app
mkdir /app 

echo -e "\e[36m>>>>>Download shipping file <<<<<\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip 

echo -e "\e[36m>>>>>Unzip shipping directory<<<<<\e[0m"
cd /app 
unzip /tmp/shipping.zip

echo -e "\e[36m>>>>>Replace shipping installation folder<<<<<\e[0m"
mvn clean package 
mv target/shipping-1.0.jar shipping.jar 

echo -e "\e[36m>>>>>Copy roboshop service file<<<<<\e[0m"
cp ${script_path}/shipping.service /etc/systemd/system/shipping.service

echo -e "\e[36m>>>>>Load SQL Schema<<<<<\e[0m"
yum install mysql -y 
mysql -h mysql-dev.rsaideepika123.online -uroot -pRoboShop@1 < /app/schema/shipping.sql 

echo -e "\e[36m>>>>>Start shipping service<<<<<\e[0m"
systemctl daemon-reload
systemctl enable shipping 
systemctl restart shipping