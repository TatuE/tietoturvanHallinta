
# Create OpenSSL keys for Nginx
echo "Generating OpenSSL keys for Nginx..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FI/ST=Uusimaa/L=Helsinki/O=Haaga-Helia/OU=Logserver/CN=logserver.local" 2> /dev/null
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048 2> /dev/null
