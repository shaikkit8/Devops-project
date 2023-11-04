script_location=$(pwd)

cp ${script_location}/file/mongo.repo/ /etc/yum.repos.d/mongo.repo

dnf install mongodb-org -y

systemctl enable mongod
systemctl restart mongod