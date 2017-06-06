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
echo "--------------------------------------"
ls
echo "--------------------------------------"
echo " "
echo "Para iniciar ejecuta arrancar.sh (sh arrancar.sh)"