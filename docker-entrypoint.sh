#!/bin/bash
set -e

# Declare list of required modules.
declare -a enable_mods=(
  "proxy"
  "proxy_fcgi"
  "alias"
  "auth_basic"
  "authn_file"
  "authz_host"
  "authz_user"
  "autoindex"
  "core"
  "dir"
  "env"
  "expires"
  "headers"
  "log_config"
  "logio"
  "mime"
  "negotiation"
  "rewrite"
  "setenvif"
  "ssl"
);

## Enable apache modules.
for mod in "${enable_mods[@]}"
do
   ENABLE_LINE="LoadModule ${mod}_module modules/mod_${mod}.so";
   echo ${ENABLE_LINE};
   sed -i "s@#${ENABLE_LINE}@${ENABLE_LINE}@" /usr/local/apache2/conf/httpd.conf;
done

## Include config for Drupal host.
echo "Include conf/extra/drupal.conf" >> /usr/local/apache2/conf/httpd.conf;

# Set upstream name.
if [ -n "$APACHE_UPSTREAM_NAME" ]; then
    sed -i 's/UPSTREAM_NAME/'"${APACHE_UPSTREAM_NAME}"'/' /usr/local/apache2/conf/extra/drupal.conf
fi

exec httpd-foreground
