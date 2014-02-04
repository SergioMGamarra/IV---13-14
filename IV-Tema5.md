# Tema 5 - Virtualización completa: uso de máquinas virtuales
## Alumno: Sergio Muñoz Gamarra

## Ejercicio 1

Lo primero que debemos hacer es comprobar que nuestro procesador soporta virtualización con:

    egrep -c '(vmx|svm)' /proc/cpuinfo
    
En mi caso obtengo un '4', lo que quiere decir que si soporta virtualización, ya que la única manera de no soporta virtualización es encontrar un '0'.
A continuación instalaremos todos los paquetes necesarios para usar kvm:

    sudo apt-get install qemu-kvm libvirt-bin virtinst virt-manager
    
    
## Ejercicio 2
    
Crearé una máquina virtual con Slitaz, de la siguiente manera:

    modprobe kvm-intel
    dd of = Slitaz.img bs = 1k seek = 100000 count = 0
    qemu-system-x86_64 -hda Slitaz.img -cdrom /home/sergio/Descargas/slitaz-4.0.iso
    
Y la máquina virtual se abrirá:

IMG: SLITAZ.PNG

Lo siguiente que vamos a instalar es ttyLinux, a partir de los siguientes comandos:

    qemu-img create -f qcow ttylinux-pc_i486-16.2.iso 100M
    qemu-system-x86_64 -hda ./ttylinux-pc_i486-16.2.iso -cdrom ttylinux-pc_i486-16.2.iso 
    
    
Y para cambiar un poco y utilizar VMware y no qemu voy a instalar Damn Small Linux, siguiendo los siguientes pasos:

- Iniciamos la creación de la máquina virtual, indicando el fichero que contiene la imagen que vamos a utilizar:

IMG: 2-FICHERO

- Seleccionamos el sistema operativo que contiene, en este caso Linux y a continuación el nombre de la máquina virtual (DSL) y la localización de la carpeta que contendrá la máquina virtual (/home/sergio/vmware/DSL).

- Finalmente configuramos el reparto de recursos de la siguiente manera:

IMG: Memoria

IMG: Procesador

Ejecutamos la máquina y ya tendremos Damn Small Linux funcionando en nuestra máquina:

IMG: FuncionandoDSL

## Ejercicio 4

Para este ejercicio usaré Lubuntu, ya que es el SO que más he manejado con un entorno gráfico LXDE.
Para comenzar vamos a utilizar qemu como ya se ha utilizado en el ejercicio 2:

     qemu-img create -f qcow2 Lubuntu.qcow2 8G
     qemu-system-x86_64 -hda  Lubuntu.qcow2 -cdrom /home/sergio/Descargas/lubuntu-13.10-desktop-i386.iso -m 512M
     
Como podemos ver en el segundo comando con la opción -m configuramos nuestra máquina virtual para que tenga 512M de RAM.

Una vez ejecutados dichos comandos ya tendremos funcionando nuestra máquina virtual:

IMG: 4-Lubuntu







