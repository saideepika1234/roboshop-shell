echo -e "\e[36m>>>>>Copy mongo repo file<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>Install mongodb<<<<<\e[0m"
yum install mongodb-org -y 

echo -e "\e[36m>>>>>Edit Ip adress in config file<<<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf

echo -e "\e[36m>>>>>Mongod service restart<<<<<\e[0m"
systemctl enable mongod 
systemctl start mongod 

## Edit the file and replace 127.0.0.1 with 0.0.0.0

