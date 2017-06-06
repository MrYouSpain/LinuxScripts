# Script para realizar una instalación automatizada
echo " --------------------------------------"
echo "     Procediendo con la instalacion"
echo " --------------------------------------"

# Comprobar si existe el archivo que contiene las variables y si existe si se quiere desechar
if [ -f ./configs/check ]
	then
		echo "Ya existe un fichero de configuracion valido"
		echo "¿Desea proceder con esa configuracion?  1(Si) / 0(No)" // Añadir S,s Y,y N,n
		read USARCFG
		echo " --------------------------------------"
		for USARCFG in 0 1 // Revisar como se introducen las variables en un for
		do
			case $USARCFG in
			0)
				rm ./configs/variables.cfg
				sh ./vars.sh;;
			1)
				echo "    Se utizará el archivo existente";;
				echo " --------------------------------------"
			esac
		done
	else
		sh ./vars.sh
fi

# Instalar los programas necesarios // segun config.cfg
sudo apt-get install -y 

# Copiar los archivos de configuracion por defecto si fuese necesario
# -- Nginx --
# sudo mv /etc/nginx/.conf /etc/nginx/.conf.old
# cp ./configs/nginx/.conf /etc/nginx/.conf
# -- Samba --
# sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.old
# cp ./configs/nerv/bash/configs/smb.conf /etc/samba/smb.conf
#

# Cambiar configuraciones
# -- Nombre de red -- // Poner nombre segun variable
sudo echo $NOMBRERED > /etc/hostname

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

# 

echo " ---------------- Instalacion realizada ---------------- "