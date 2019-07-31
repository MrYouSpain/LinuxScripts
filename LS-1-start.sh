# Script para arrancar los otros scripts y que se ejecuten ya actualizados

# Introducir contraseña para sudo y que no lo pida despues
echo " "
sudo echo "Ejecutando los scripts"
cd
# Meter bucle para que no avance hasta que no haya error

# git -C ./LinuxScripts pull
cd ./LinuxScripts
git pull origin

# Arrancando los scripts por orden
#sh ./LS-2a-mant.sh
sh ./LS-2b-vars.sh
sh ./LS-2c-instalacion.sh

echo "Script finalizado, se recomienda reiniciar (sudo reboot)"