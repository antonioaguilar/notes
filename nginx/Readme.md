# Nginx scripts

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
