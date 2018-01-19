#!/bin/bash
cd ../..
sudo su
sudo apt install tor
cd etc/tor
sed -i -e "s/#DataDirectory \/var\/lib\/tor/DataDirectory \/var\/lib\/tor/g" torrc
sed -i -e "s/#HiddenServiceDir \/var\/lib\/tor\/hidden_service\// HiddenServiceDir \/var\/lib\/tor\/hidden_service\//g" torrc
sed -i -e "s/#HiddenServicePort 80 127.0.0.1:80/HiddenServicePort 80 127.0.0.1:80/g" torrc
sudo service tor reload
sudo apt install apache2
cd ../apache2
sed -i -e "s/Listen 80/Listen 127.0.0.1:80/g" ports.conf
cd sites-enabled
sed -i -e "s/<VirtualHost *:80>/<VirtualHost 127.0.0.1:80>/g" 000-default.conf
