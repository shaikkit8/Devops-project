set -e
script_location=$(pwd)

cp ${script_location}/file/mongodb.repo /etc/yum.repos.d/mongodb.repo

dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf