echo -e "\e[36m>>>>>Install rpms repo files<<<<\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

echo -e "\e[36m>>>>>Install Redis<<<<<\e[0m"
dnf module enable redis:remi-6.2 -y
yum install redis -y 

## File to be edit listen address from 127.0.0.1 to 0.0.0.0 in /etc/redis.conf
echo -e "\e[36m>>>>>Change port number<<<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf

echo -e "\e[36m>>>>>Redis systrem restart<<<<<\e[0m"
systemctl enable redis 
systemctl start redis 
