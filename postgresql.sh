#steps to install postgresql in Centos

sudo su -
sudo yum install postgresql11-server -y

sudo /usr/pgsql-11/bin/postgresql-11-setup initdb

sudo systemctl start postgresql-11

sudo systemctl enable postgresql-11

sudo systemctl status postgresql-11

#for queries refer https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-7

sudo yum install sqlite3