#!/usr/bin/env bash

set -e

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

if [[ "$1" = 'run' ]]; then
  _grav_conf
  a2enmod rewrite
  /etc/init.d/apache2 restart
  tail -f /dev/null
else
  exec "$@"
fi

exit 0;
