echo -e "\e[36m>>>>>Download Erland and RabbitMQ packages<<<<<\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

echo -e "\e[36m>>>>>Install Erland and RabbitMQ packages<<<<<\e[0m"
yum install erlang -y
yum install rabbitmq-server -y 

echo -e "\e[36m>>>>>Restart RabbitMQ server<<<<<\e[0m"
systemctl enable rabbitmq-server 
systemctl start rabbitmq-server 

echo -e "\e[36m>>>>>Add roboshop user and set permissions<<<<<\e[0m"
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"