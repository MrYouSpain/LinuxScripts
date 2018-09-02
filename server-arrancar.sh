# Script para arrancar los otros scripts y que se ejecuten ya actualizados

# Introducir contraseña para sudo y que no lo pida despues
echo " "
sudo echo "Ejecutando los scripts"
cd
# git -C ./LinuxScripts pull
cd ./LinuxScripts
git pull origin

# Arrancando los scripts por orden
#sh server-mant.sh
sh ./server-vars.sh
sh ./server-instalacion.sh

echo "Script finalizado, se recomienda reiniciar (sudo reboot)"