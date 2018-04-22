FROM nginx:1.13.8

COPY htdocs /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf

COPY cert.pem /etc/nginx/cert.pem

COPY key.priv /etc/nginx/key.priv