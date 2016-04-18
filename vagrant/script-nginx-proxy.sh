#!/usr/bin/env bash

echo "Performing apt-get updates ..."
apt-get update > /dev/null

echo "Installing required packages"
apt-get install libc6 libpcre3 libpcre3-dev zlib1g-dev lsb-base libssl-dev -y

# install OpenSSL
#wget http://www.openssl.org/source/openssl-1.0.1i.tar.gz
#tar zxf openssl-1.0.1i.tar.gz
#cd openssl-1.0.1i
#./config
#make
#make install

# move back to home folder
#cd ~

# install nginx web server
echo "Downloading latest version of nginx ..."
wget --quiet https://raw.githubusercontent.com/antonioaguilar/aws-scripts/master/nginx/nginx

echo "Configuring nginx deamon ..."
cp nginx /etc/init.d/nginx
chmod +x /etc/init.d/nginx
/usr/sbin/update-rc.d -f nginx defaults

echo "Compiling nginx from latest source ..."
wget --quiet http://nginx.org/download/nginx-1.7.4.tar.gz
tar zxf nginx-1.7.4.tar.gz

cd nginx-1.7.4
./configure --sbin-path=/usr/local/sbin --with-http_ssl_module
make
make install
echo "nginx was compiled and installed ..."

# start the nginx deamon
/etc/init.d/nginx start
