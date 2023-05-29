script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

component=user
fun_nodejs

echo -e "\e[36m>>>>>Copy mongodb repo<<<<<\e[0m"
cp ${script_path}/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>Install Mongodb<<<<<\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[36m>>>>>Load mongodb schema<<<<<\e[0m"
mongo --host mongodb-dev.rsaideepika123.online </app/schema/user.js