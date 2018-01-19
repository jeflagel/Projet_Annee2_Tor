#!/bin/bash
ssh -i/Users/Laurine/.ssh/tor.isima.fr ubuntu@193.55.95.207
cd ../..
sudo su
sudo apt install tor
Y
cd etc/tor
sed -i -e "s/#DataDirectory \/var\/lib\/tor/DataDirectory \/var\/lib\/tor/g" torrc
sed -i -e "s/#HiddenServiceDir \/var\/lib\/tor\/hidden_service\// HiddenServiceDir \/var\/lib\/tor\/hidden_service\//g" torrc
sed -i -e "s/#HiddenServicePort 80 127.0.0.1:80/HiddenServicePort 80 127.0.0.1:80/g" torrc
echo RunAsDaemon 1 # Démarre Tor en tant que tâche de fond
echo DirPort 9030 # Port pour le référencement du relais
echo ORPort 9001             # Port du relais
echo "SocksPort 0 # Ajoutez cette ligne si vous n’utiliserez pas Tor sur votre réseau local
Nickname JerLaurZZ2   # Nom du relais
ContactInfo projetzz2tor@gmail.com  # Une adresse e-mail de contact
#Exitpolicy reject *:* # Rejette le trafic sortant afin de devenir un nœud intermédiaire
RelayBandwidthRate 1250 KBytes  # Limite de la bande passante pour le relais
RelayBandwidthBurst 1450 KBytes # Burst de bande passante pour le relais (au cas où la bande passante maximum est atteinte)" >> torrc
sudo service tor reload
cd ../../../var/lib/tor/hidden_service
