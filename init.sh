#!/bin/bash
sudo apt install tor
sudo apt install apache2
cd ../..
cd etc/tor
sudo vi torrc  #on décommente DataDirectory et Hidden-service
sudo service tor reload
cd ..
cd apache2
sudo vi ports.conf # remplacer la ligne Listen 80 par Listen 127.0.0.1:80
cd sites-enabled
sudo vi 000-default.conf #remplacer <VirtualHost * :80> par <VirtualHost 127.0.0.1:80> et serveurName
sudo service apache2 restart
iptables -A INPUT -i eth0 -p tcp --dport 9001 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 9030 -m state --state ESTABLISHED -j ACCEPT
service iptables restart && service tor restart
