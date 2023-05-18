echo -e "\e[36m>>>>>Install Golang<<<<<\e[0m"
yum install golang -y

echo -e "\e[36m>>>>>Add Roboshop user<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>Create app directory<<<<<\e[0m"
mkdir /app 

echo -e "\e[36m>>>>>Download dispatch file<<<<<\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip 

echo -e "\e[36m>>>>>Unzip directories<<<<<\e[0m"
cd /app 
unzip /tmp/dispatch.zip

echo -e "\e[36m>>>>>Install<<<<<\e[0m"
go mod init dispatch
go get 
go build

echo -e "\e[36m>>>>>Copy dispatch service file<<<<<\e[0m"
cp /home/centos/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service

echo -e "\e[36m>>>>>Dispatch service restart<<<<<\e[0m"
systemctl daemon-reload
systemctl enable dispatch 
systemctl start dispatch
