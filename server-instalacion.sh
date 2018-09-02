# Script para realizar una instalación automatizada
echo " --------------------------------------"
echo "     Procediendo con la instalacion"
echo " --------------------------------------"

# Instalar los programas necesarios // segun server-variables.cfg
./configs/server-variables.cfg
sudo apt-get install -y 

# Copiar los archivos de configuracion por defecto si fuese necesario
# -- Nginx --
# sudo mv /etc/nginx/.conf /etc/nginx/.conf.old
# cp ./configs/nginx/.conf /etc/nginx/.conf
# -- Samba --
# sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.old
# cp ./configs/nerv/bash/configs/smb.conf /etc/samba/smb.conf
#

# -- Carpeta compartida -- // Compartir en red local la carpeta home
# guest account = pi
mkdir /compartido // Carpeta con los enlaces simbolicos de lo que se quiere compartir


# Reiniciar servicios
sudo service nginx restart
sudo service samba restart

# Crear los enlaces a los archivos 
mkdir /configs // enlaces a los archivos de configuracion, tambien compartir en red

#ln -s ./nerv/bash/mant.sh mant.sh
#ln -s ./nerv/python/prueba.py prueba.py
#ls -l 

# Arrancar script de software avanzado (Owncloud, etc)

echo " ---------------- Instalacion realizada ---------------- "