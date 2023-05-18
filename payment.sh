echo -e "\e[36m>>>>>Install Python<<<<<\e[0m"
yum install python36 gcc python3-devel -y

echo -e "\e[36m>>>>>Create Roboshop user<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>Create App directory<<<<<\e[0m"
mkdir /app 

echo -e "\e[36m>>>>>Download payment service directory<<<<<\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip 
cd /app 

echo -e "\e[36m>>>>>Unzip payment directory<<<<<\e[0m"
unzip /tmp/payment.zip

pip3.6 install -r requirements.txt

echo -e "\e[36m>>>>>Copy payment service file<<<<<\e[0m"
cp /home/centos/roboshop-shell/payment.service vim /etc/systemd/system/payment.service

echo -e "\e[36m>>>>>Start Payment service<<<<<\e[0m"
systemctl daemon-reload
systemctl enable payment 
systemctl start payment