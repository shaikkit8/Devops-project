script_lcation=$(pwd)
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

dnf install nodejs -y

useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip

cd /app
npm install

cp ${script_lcation} /file/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue