#!/usr/bin/env bash

set -e

_update_uid_gid() {
  # default: uid=33(www-data) gid=33(www-data) groups=33(www-data)
  groupmod -g ${GID_WWW_DATA} www-data
  usermod -u ${UID_WWW_DATA} www-data
  chown -R www-data: /var/www/html/
}

_grav_conf () {
  local OUTFILE=/etc/apache2/sites-available/grav.conf
  echo "<VirtualHost *:80>" > $OUTFILE
  echo "ServerAdmin ${SERVERADMIN}" >> $OUTFILE
  echo "DocumentRoot /var/www/html/" >> $OUTFILE
  echo "ServerName ${SERVERNAME}" >> $OUTFILE
  echo "ServerAlias ${SERVERALIAS}" >> $OUTFILE
  echo "<Directory /var/www/html/>" >> $OUTFILE
  echo "Options FollowSymLinks" >> $OUTFILE
  echo "AllowOverride All" >> $OUTFILE
  echo "Order allow,deny" >> $OUTFILE
  echo "allow from all" >> $OUTFILE
  echo "</Directory>" >> $OUTFILE
  echo "ErrorLog /var/log/apache2/your-domain.com-error_log" >> $OUTFILE
  echo "CustomLog /var/log/apache2/your-domain.com-access_log common" >> $OUTFILE
  echo "</VirtualHost>" >> $OUTFILE
  ln -s $OUTFILE /etc/apache2/sites-enabled/grav.conf
}

_var_www_html () {
  if ! [ "$(ls -A /var/www/html)" ]; then
    cd /var/www/html/
    unzip /grav-admin-v1.3.0-rc.4.zip
    cd grav-admin
    cp -a * ..
    cp .htaccess ..
    chown -R www-data: /var/www/html/
  fi
}

if [[ "$1" = 'run' ]]; then
  _update_uid_gid
  _var_www_html
  _grav_conf
  a2enmod rewrite
  /etc/init.d/apache2 restart
  tail -f /dev/null
else
  exec "$@"
fi

exit 0;
