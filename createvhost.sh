#!/bin/bash
#bash snc.sh site user
if [ -z $1 ] ; then
echo «Do not set your domain name.»
exit 1 ; fi
if [ -z $2 ] ; then
username='im'
echo «Do not set your user name. Default name is ${username}» ; fi
if [ -d ~/$1/ ]; then
echo '«Directory exist, script stoped.»'
exit 1; fi


mkdir -p /home/$username/public_html/$1/public_html
echo "127.0.0.1 "$1 | sudo tee -a /etc/hosts

sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-availa$

sudo sed -e "s!\#ServerName www.example.com!ServerName ${1}!; s!DocumentRoot /v$
sudo rm /etc/apache2/sites-available/$1.tmp.conf

sudo a2ensite $1
sudo chown $username:www-data -R /home/$username/public_html/$1
chmod -R 775 /home/$username/public_html/$1
sudo service apache2 reload
