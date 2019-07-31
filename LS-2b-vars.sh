# Script para crear un archivo de configuracion con variables para que las usen otros scripts

# Nombres y rutas de archivos
CFG=./install/config/LS-variables.cfg
CFGTMP=./tmp/LS-variables.cfg.tmp

# Comprobar si existe el archivo que contiene las variables y si existe si se quiere desechar
if [ -f $CFG ]
	then
		echo "Ya existe un fichero de configuracion valido"
		echo " "
		PS3='¿Desea proceder con esa configuración?'
		options=("Si" "No")
		select opt in "${options[@]}"
		do
			case $opt in
				"Si")
					echo "    Se utizará el archivo existente"
					echo " --------------------------------------"
					exit 1
					;;
				"No")
					rm $CFG
					rm $CFGTMP 2> /dev/null
					break
					;;
				*) echo "Opción no válida";;
			esac
		done
	else
		rm $CFGTMP 2> /dev/null
fi

echo " - Arrancando script para definir variables -"

# Se crea un archivo temporal que contendrá las variables
touch $CFGTMP

# Nombre de red // Samba
echo "El nombre de red actual es:"
cat /etc/hostname
echo " "

PS3='¿Definir uno nuevo?'
options=("Si" "No")
select opt in "${options[@]}"
do
	case $opt in
		"Si")
			echo "Introduce nombre de red"
			read NOMBRERED
			echo "NOMBRERED=$NOMBRERED" >> .configs/LS-variables.cfg.tmp
			break
			;;
		"No")
			echo "Se utizará el nombre de red existente"
			break
			;;
		*) echo "Opción no válida";;
	esac
done

# Seleccionar qué software se va a instalar
echo "El paquete básico contiene:
samba
git
screen
fail2ban
wakeonlan
logwatch
webmin
idioma español
 "

PS3='¿Instalar el paquete básico?'
options=("Si" "No")
select opt in "${options[@]}"
do
	case $opt in
		"Si")
			BASICO=1
			echo "Se instalará el paquete básico"
			break
			;;
		"No")
			BASICO=0
			echo "No se instalará el paquete básico"
			break
			;;
		*) echo "Opción no válida";;
	esac
done

echo "El paquete de funciones de servidor web contiene:
nginx
mariadb-server
phpmyadmin
php5-cgi
 "

PS3='¿Instalar el paquete de servidor web?'
options=("Si" "No")
select opt in "${options[@]}"
do
	case $opt in
		"Si")
			WEB=1
			echo "Se instalará el paquete de servidor web"
			break
			;;
		"No")
			WEB=0
			echo "No se instalará el paquete de servidor web"
			break
			;;
		*) echo "Opción no válida";;
	esac
done

echo "El paquete de servidor de descarga contiene:
transmission-daemon
pyload
ftp
 "

PS3='¿Instalar el paquete de servidor descargas?'
options=("Si" "No")
select opt in "${options[@]}"
do
	case $opt in
		"Si")
			DESCARGAS=1
			echo "Se instalará el paquete de servidor de descargas"
			break
			;;
		"No")
			DESCARGAS=0
			echo "No se instalará el paquete de servidor de descargas"
			break
			;;
		*) echo "Opción no válida";;
	esac
done

FECHAVARIABLES=
echo $FECHAVARIABLES >> $CFGTMP

# Hace archivo definitivo
mv $CFGTMP $CFG