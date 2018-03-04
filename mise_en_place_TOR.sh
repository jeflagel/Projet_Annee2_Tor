#!/bin/bash
echo '#Tor'
echo 'deb http://deb.torproject.org/torproject.org xenial main' >> /etc/apt/sources.list
echo 'deb-src http://deb.torproject.org/torproject.org xenial main' >> /etc/apt/sources.list
gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
apt update
apt install tor deb.torproject.org-keyring
cd /etc/tor
sed -i -e "s/#DataDirectory \/var\/lib\/tor/DataDirectory \/var\/lib\/tor/g" torrc
sed -i -e "s/#HiddenServiceDir \/var\/lib\/tor\/hidden_service\// HiddenServiceDir \/var\/lib\/tor\/hidden_service\//g" torrc
sed -i -e "s/#HiddenServicePort 80 127.0.0.1:80/HiddenServicePort 80 127.0.0.1:80/g" torrc

#Pour un relais tor
#echo "RunAsDaemon 1 # Démarre Tor en tant que tâche de fond
#  DirPort 9030 # Port pour le référencement du relais
#  ORPort 9001             # Port du relais
#  SocksPort 0 # Ajoutez cette ligne si vous n’utiliserez pas Tor sur votre réseau local
#  Nickname JerLaurZZ2   # Nom du relais
#  ContactInfo projetzz2tor@gmail.com  # Une adresse e-mail de contact
  #Exitpolicy reject *:* # Rejette le trafic sortant afin de devenir un nœud intermédiaire
#  RelayBandwidthRate 1250 KBytes  # Limite de la bande passante pour le relais
#  RelayBandwidthBurst 1450 KBytes # Burst de bande passante pour le relais (au cas où la bande passante maximum est atteinte)" >> torrc
sudo service tor reload
cd /var/lib/tor/hidden_service
sed -n -e '1,8p' /etc/apache2/sites-enabled/000-default.conf > /etc/apache2/sites-enabled/conf2
servername="ServerName "`cat hostname`
echo $servername >> /etc/apache2/sites-enabled/conf2
sed -n -e '10,$p' /etc/apache2/sites-enabled/000-default.conf >> /etc/apache2/sites-enabled/conf2
mv /etc/apache2/sites-enabled/conf2 /etc/apache2/sites-enabled/000-default.conf
service apache2 restart
