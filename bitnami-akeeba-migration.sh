#!/bin/sh
apt-get install git-core -y
mkdir /home/bitnami/backup
cp /opt/bitnami/apps/joomla/htdocs/.htaccess /home/bitnami/backup/htaccess.backup
cp /opt/bitnami/apps/joomla/conf/httpd-vhosts.conf /home/bitnami/backup/httpd-vhosts_backup.conf
cp /opt/bitnami/apps/joomla/conf/httpd-app.conf /home/bitnami/backup/httpd-app_backup.conf
cp /opt/bitnami/apps/joomla/conf/httpd-prefix.conf /home/bitnami/backup/httpd-prefix_backup.conf
cp /opt/bitnami/apps/joomla/conf/htaccess.conf /home/bitnami/backup/htaccess_backup.conf
wget -O /home/bitnami/kickstart.zip https://www.akeebabackup.com/download/akeeba-kickstart/5-4-2/kickstart-core-5-4-2-zip.zip
cp /opt/bitnami/apps/joomla/htdocs/configuration.php /home/bitnami/backup
sudo rm -rf /opt/bitnami/apps/joomla/htdocs
mysql_pass=$(</home/bitnami/bitnami_application_password)
sudo /opt/bitnami/mysql/bin/mysql -u root -p$mysql_pass -Bse "drop database bitnami_joomla;"
unzip kickstart.zip -d /opt/bitnami/apps/joomla/htdocs
mkdir /opt/bitnami/apps/joomla/htdocs/akeebatemp
chmod 777 /opt/bitnami/apps/joomla/htdocs/akeebatemp
cp /home/bitnami/*.jpa /opt/bitnami/apps/joomla/htdocs/
sudo chown -R daemon /opt/bitnami/apps/joomla/htdocs