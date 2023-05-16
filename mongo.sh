cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org -y 

sed -i -e 's|127.0.0.1|0.0.0.0|' etc/mongod.conf

systemctl enable mongod 
systemctl start mongod 

## Edit the file and replace 127.0.0.1 with 0.0.0.0

