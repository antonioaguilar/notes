# Nginx scripts

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
