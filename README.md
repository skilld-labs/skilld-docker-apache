# Apache 2.4 for Drupal development

#### Example usage:

  ```yaml
  version: "2"
  
  services:
    apache:
      build: .
      environment:
        APACHE_UPSTREAM_NAME: php
      volumes_from:
        - php
      ports:
        - "80:80"
  
    php:
      image: skilldlabs/php:7-fpm
      volumes:
        - ./docroot:/var/www/html
  ```
  
#### Enabled Apache modules:
  * proxy
  * proxy_fcgi
  * alias
  * auth_basic
  * authn_file
  * authz_host
  * authz_user
  * autoindex
  * core
  * dir
  * env
  * expires
  * headers
  * log_config
  * logio
  * mime
  * negotiation
  * rewrite
  * setenvif
  * ssl
