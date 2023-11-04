set -e
script_location=$(pwd)

cp ${script_location}/file/mongodb.repo /etc/yum.repos.d/mongodb.repo

dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod