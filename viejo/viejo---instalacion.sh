# Script para realizar una instalación automatizada
echo " --------------------------------------"
echo "     Procediendo con la instalacion"
echo " --------------------------------------"

# Comprobar si existe el archivo que contiene las variables y si existe si se quiere desechar
if [ -f ./configs/check.tmp ]
	then
		echo "Ya existe un fichero de configuracion valido"
		echo " "
		PS3='¿Desea proceder con esa configuración?'
		options=("Si" "No")
		select opt in "${options[@]}"
		do
			case $opt in
				"Si")
					echo "    Se utizará el archivo existente";;
					echo " --------------------------------------"
					break
					;;
				"No")
					rm ./configs/variables.cfg
					sh ./vars.sh
					break
					;;
				*) echo "Opción no válida";;
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