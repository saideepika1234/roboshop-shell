script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

echo -e "\e[36m>>>>>Install Nginx service<<<<<\e[0m"
yum install nginx -y 

echo -e "\e[36m>>>>>Delete previous content<<<<<\e[0m"
rm -rf /usr/share/nginx/html/* 

echo -e "\e[36m>>>>>Download Frontend directory<<<<<\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[36m>>>>>Unzip directory<<<<<\e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

echo -e "\e[36m>>>>>Copy roboshop config file<<<<\e[0m"
cp ${script_path}/roboshop.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[36m>>>>>Nginx nginx restart<<<<<\e[0m"
systemctl restart nginx 
systemctl enable nginx 