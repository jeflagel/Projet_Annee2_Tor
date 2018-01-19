sudo apt install apache2
cd ../apache2
sed -i -e "s/Listen 80/Listen 127.0.0.1:80/g" ports.conf
echo "ServerName 127.0.0.1" >> apache2.conf
cd sites-enabled
sed -i -e "s/<VirtualHost *:80>/<VirtualHost 127.0.0.1:80>/g" 000-default.conf
