set -e
script_lcation=$(pwd)
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

dnf install nodejs -y

#useradd roboshop

mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
rm -rf /app/*
cd /app
unzip /tmp/catalogue.zip

cd /app
npm install

cp ${script_lcation} /file/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
cp ${script_location}/file/mongodb.repo /etc/yum.repos.d/mongodb.repo
dnf install mongodb-org-shell -y
mongo --host localhost </app/schema/catalogue.js