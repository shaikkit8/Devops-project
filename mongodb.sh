script_location=$(pwd)
cp ${script_location}/file/mongodb.repo/ /etc/yum.repos.d/mongo.repo

dnf install mongodb-org -y

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

systemctl enable mongodb
systemctl restart  mongodb