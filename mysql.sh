script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

echo -e "\e[36m>>>>>Disable previous Mysql<<<<<\e[0m"
dnf module disable mysql -y 

echo -e "\e[36m>>>>>Copy mysql repo file<<<<<\e[0m"
cp ${script_path}/mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[36m>>>>>Install MQSQL service<<<<<\e[0m"
yum install mysql-community-server -y

echo -e "\e[36m>>>>>Start Mqsql service<<<<<\e[0m"
systemctl enable mysqld
systemctl start mysqld  

echo -e "\e[36m>>>>>Change permissions for the roboshop user<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
