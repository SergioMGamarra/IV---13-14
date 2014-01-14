# Tema 5 - Virtualización completa: uso de máquinas virtuales
## Alumno: Sergio Muñoz Gamarra

# Ejercicio 1

Lo primero que debemos hacer es comprobar que nuestro procesador soporta virtualización con:

    egrep -c '(vmx|svm)' /proc/cpuinfo
    
En mi caso obtengo un '4', lo que quiere decir que si soporta virtualización, ya que la única manera de no soporta virtualización es encontrar un '0'.
A continuación instalaremos todos los paquetes necesarios para usar kvm:

    sudo apt-get install qemu-kvm libvirt-bin virtinst virt-manager
    
Crearé una máquina virtual con Slitaz, de la siguiente manera:

    modprobe kvm-intel
    dd of = Slitaz.img bs = 1k seek = 100000 count = 0
    qemu-system-x86_64 -hda Slitaz.img -cdrom /home/sergio/Descargas/slitaz-4.0.iso
    
Y la máquina virtual se abrirá:

IMG: SLITAZ.PNG
