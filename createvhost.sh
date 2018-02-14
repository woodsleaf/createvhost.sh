#!/bin/bash
#sudo bash snc.sh site user
if [ -z $1 ] ; then
echo «Do not set your domain name.»
exit 1 ; fi
if [ -z $2 ] ; then
username='im'
echo «Do not set your user name.» ; fi

mkdir -p /home/$username/public_html/$1/public_html
echo "127.0.0.1 "$1 | sudo tee -a /etc/hosts

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$1.tmp.conf

sed -e "s!\#ServerName www.example.com!ServerName ${1}!; s!DocumentRoot /var/www/html!DocumentRoot /home/${username}/public_html/${1}/public_html!" /etc/apache2/sites-available/$1.tmp.conf > /etc/apache2/sites-available/$1.conf
rm /etc/apache2/sites-available/$1.tmp.conf

a2ensite $1
chown $username:www-data -R /home/$username/public_html/$1
chmod -R 775 /home/$username/public_html/$1
