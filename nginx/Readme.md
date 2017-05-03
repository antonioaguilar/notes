# Nginx scripts

## Default ```nginx.conf``` 

```bash
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
  worker_connections 768;
}

http {
  sendfile on;
  tcp_nopush on;
  tcp_nodelay on;
  keepalive_timeout 65;
  types_hash_max_size 2048;

  include /etc/nginx/mime.types;
  default_type application/octet-stream;

  ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # Dropping SSLv3, ref: POODLE
  ssl_prefer_server_ciphers on;

  access_log /var/log/nginx/access.log;
  error_log /var/log/nginx/error.log;

  gzip on;
  gzip_disable "msie6";

  gzip_vary on;
  gzip_proxied any;
  gzip_comp_level 6;
  gzip_buffers 16 8k;
  gzip_http_version 1.1;
  gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

  include /etc/nginx/conf.d/*.conf;
  include /etc/nginx/sites-enabled/*;
}
```

## Simple Load Balancer for Docker Containers

```bash
http {
  upstream webapp {
    server CONTAINER_APP0_IP:PORT;
    server CONTAINER_APP1_IP:PORT;
    server CONTAINER_APP2_IP:PORT;
  }
  server {
    listen 80;
    location / {
      proxy_pass http://webapp;
  }
}
```

## Simple server config with CORS enabled

```bash
server {
  listen 8080 default_server;
  server_name localhost;

  root /home/user/website;
  index index.html index.htm;

  location / {
    autoindex on;
    try_files $uri $uri/ =404;

    # Wide-open CORS config for nginx
    # Configuration from: http://enable-cors.org/server_nginx.html
    if ($request_method = 'OPTIONS') {
      add_header 'Access-Control-Allow-Origin' '*';
      add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
      add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
      add_header 'Access-Control-Max-Age' 1728000;
      add_header 'Content-Type' 'text/plain charset=UTF-8';
      add_header 'Content-Length' 0;
      return 204;
    }
    
    if ($request_method = 'POST') {
      add_header 'Access-Control-Allow-Origin' '*';
      add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
      add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
    }
    
    if ($request_method = 'GET') {
      add_header 'Access-Control-Allow-Origin' '*';
      add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
      add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
    }

  }
}

```

## HTTP and HTTPS server  

```bash
server {
  listen 80 default_server;
  server_name localhost;

  root /home/website;
  index index.html index.htm;

  location / {
    autoindex on;
    try_files $uri $uri/ =404;
  }
}

server {
  listen 443;
  server_name localhost;

  root /home/website;
  index index.html index.htm;

  ssl on;
  ssl_session_timeout 5m;

  ssl_certificate /etc/nginx/sites-available/cert.pem;
  ssl_certificate_key /etc/nginx/sites-available/key.pem;

  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";
  ssl_ecdh_curve secp384r1;
  ssl_session_cache shared:SSL:10m;
  ssl_stapling on;
  ssl_stapling_verify on;

  add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
  add_header X-Frame-Options DENY;
  add_header X-Content-Type-Options nosniff;

  location / {
    autoindex on;
    try_files $uri $uri/ =404;
  }
}
```

## Reverse Proxy configuration

```bash
server {
  listen 80;

  server_name localhost;

  location /api {
      proxy_pass http://localhost:9200/;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection 'upgrade';
      proxy_set_header Host $host;
      proxy_cache_bypass $http_upgrade;
  }
}
```
Note: This example is configured for ElasticSearch

## Re-direct any error 404 page to a default domain

```
# include this in /etc/nginx/sites-available/default
error_page 404 =301 http://example.com/;
```

## Configure Basic Auth (htaccess) in nginx

```sudo sh -c "echo -n 'sammy:' >> /etc/nginx/.htpasswd"```

Add an encrypted password entry for the username:

```sudo sh -c "openssl passwd -apr1 >> /etc/nginx/.htpasswd"```

Configure your nginx to require Basic Auth:

```bash
server {

  listen 80 default_server;
  listen [::]:80 default_server;

  root /var/www/html;

  index index.html index.htm;

  server_name beform.ie;

  location / {
    try_files $uri $uri/ =404;
    auth_basic "Restricted Content";
    auth_basic_user_file /etc/nginx/.htpasswd;
  }

}
```

## Custom HTTPS redirect

```bash
server {
  listen 9443;
  server_name localhost;

  ssl on;
  ssl_session_timeout 5m;

  ssl_certificate /etc/nginx/sites-available/cert.pem;
  ssl_certificate_key /etc/nginx/sites-available/key.pem;

  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";
  ssl_ecdh_curve secp384r1;
  ssl_session_cache shared:SSL:10m;
  ssl_stapling on;
  ssl_stapling_verify on;

  add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
  add_header X-Frame-Options DENY;
  add_header X-Content-Type-Options nosniff;

  location / {
      proxy_pass http://localhost:9090/;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection 'upgrade';
      proxy_set_header Host $host;
      proxy_cache_bypass $http_upgrade;
  }
}
```
