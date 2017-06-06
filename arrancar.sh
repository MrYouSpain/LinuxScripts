# Script para arrancar los otros scripts y que se ejecuten ya actualizados

# Introducir contraseña para sudo y que no lo pida despues
echo " "
sudo echo "Ejecutando los scripts"
cd
cd ./LinuxScripts

# Arrancando los scripts por orden
sh mant.sh
sh instalacion.sh

echo "Script finalizado, se recomienda reiniciar (sudo reboot)"