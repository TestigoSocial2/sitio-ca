FROM scratch

MAINTAINER bcessa <ben@pixative.com>

ADD ca-certificates.crt /etc/ssl/certs/ca-certificates

ADD htdocs /var/www/htdocs

ADD sitio-ca /

EXPOSE 8888

ENTRYPOINT ["/sitio-ca"]
