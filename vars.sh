# Script para crear un archivo de configuracion con variables para que las usen otros scripts
echo "Arrancando script para definir variables"

# Eliminar check anterior
rm check 2> /dev/null

# Nombre de red // Samba
echo "Introduce nombre de red"
read NOMBRERED

# Cosas que instalar
# Basico
samba
git
screen
fail2ban // Crear usuario de acceso remoto y cerrar el acceso remoto a Odroid
wakeonlan
logwatch
rutas montaje del HDD
webmin
idioma

# Server
nginx
mariadb-server
phpmyadmin
php5-cgi

# Archivos
transmission-daemon
pyload
ftp
owncloud // NextCLoud, Pydio
drive // Usar cuenta de Gmail propia

# Avanzado
openvpn
dns dinamico

# Otros
kodi // Hacer que arranque solo

# Checkear que ha finalizado
touch check
echo "Finalizado correctamente" >> check