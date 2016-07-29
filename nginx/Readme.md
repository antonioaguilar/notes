# Nginx scripts

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
