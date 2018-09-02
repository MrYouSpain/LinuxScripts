# Script inicial descargar lo necesario // Descargable con wget
sudo echo "Instalara GIT para poder sincronizar con el respositorio de GitHub"
echo " "

# Instalar git para poder descargar desde github
sudo apt-get install -y git
echo " "

# Nos situamos en la carpeta home
cd

# Descargar el repositorio desde GitHub
git clone https://github.com/MrYouSpain/LinuxScripts

# Nos situa en la carpeta de los scripts y la lista
cd ./LinuxScripts
echo " "
echo "  Estos son los scripts descargados"
echo "--------------------------------------"
ls -1
echo "--------------------------------------"
echo " "

# Iniciar los scripts de instalación
PS3='¿Desea iniciar la instalación?'
options=("Si" "No")
select opt in "${options[@]}"
do
	case $opt in
		"Si")
			sh server-arrancar.sh
			break
			;;
		"No")
			break
			;;
		*) echo "Opción no válida";;
	esac
done
