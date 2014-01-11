# Ejercicios Tema 4 - Almacenamiento Virtual

Alumno: Sergio Muñoz Gamarra

## Ejercicio 1

La distribución de mi disco duro responde a la estructura que aparece en la siguiente imagen:

![Ejercicio1a](https://github.com/SergioMGamarra/IV---13-14/blob/master/imgTema4/ej1-a.png?raw=true)


En cuanto a los ordenadores de la facultad funcionan a través de un sistema de ficheros remoto, usando NFS para devolver los archivos de los usuarios.

## Ejercicio 2

Para este ejercicio lo primero que tendremos que hacer es crear un contenedor, este contenedor debe además tener instalado sshfs fuse:

    lxc-create -t ubuntu -n caja-ubuntu
    lxc-start -n caja-ubuntu
    apt-get install sshfs fuse
    
Además instalaremos sshfs en nuestro local con el comando anterior.
A continuación debemos crear uin usario al grupo de usuarios de fuse con el siguiente comando:
    
    usermod -a -G fuse ubuntu


Una vez instalados los paquetes y creado el usuario crearemos el directorio que queremos mapear con el comando:

    mkdir ~/Remoto


y creamos otro directorio en nuestro home dónde montaremos el directorio:

    mkdir HomeRemoto
    

Como último paso nos queda conectarlos a partir de la IP del contenedor, en mi caso: 10.0.3.200, con el siguiente comando:

    sshfs ubuntu@10.0.3.200:/home/ubuntu/Remoto /home/sergio/HomeRemoto
    
    CAPTURA sshfs.png
    
Accediendo a nuestro directorio desde el navegador de directorios podemos ver que nos encontramos con nuestro directorio remoto:

CAPTURA DIRECTORIO.PNG



## Ejercicio 3

Para este ejercicio crearé ficheros en formato img y en formato vmdk utilizando como herramienta la biblioteca qemu, y asignandoles un tamaño de 20MB, usando los siguientes comandos:

    
    qemu-img create -f vmdk vmdk.vmdk 20M
    qemu-img create -f raw img.img 20M
    
EJERCICIO3-CREARIMG

Y a continuación intenté montarlas pero al no estar formateado no es posible, usé:

     mount -o loop,offset=32256 img.img /mnt/
     mount -o loop,offset=32256 vmdk.vmdk /mnt/
    
los cuales me devolvieron el siguiente error:

    mount: debe especificar el tipo de sistema de archivos

    
## Ejercicio 4

Lo primero que debemos hacer es crear los archivos .img:

    qemu-img create xfs.img 20M
    qemu-img create -f raw btrfs.img 20M

El siguiente paso es convertirlas en dispositivos loop 

    losetup -v -f xfs.img
    losetup -v -f btrfs.img
    
A continuación formatearemos las unidades, utilizando el comando:

    mkfs.xfs /dev/loop0
    mkfs.btrfs /dev/loop2
    
Después de esto crearemos los directorios y montaremos las unidades:

-Creamos los directorios donde los montaremos:

    mkdir /mnt/btrfs
    
IMG: BTRFS.PNG 
    
    mkdir /mnt/xfs

IMG:XFS.PNG

-Montamos las unidades:

    sudo mount /dev/loop0 /mnt/xfs/
    sudo mount /dev/loop2 /mnt/btrfs/
    
Quedando en perfecto funcionamientos las unidades ya montadas:

IMG: DF.PNG


## Ejercicio 5

Para la instalación de ceph se usará:

    apt-get install ceph-mds
    
## Ejercicio 7

Inicialmente creamos la piscina:

    rados mkpool piscinaca

PROBLEMA GLOBAL_INIT





## Ejercicio 8

Tras crear la cuenta de Azure y recibir el 'pass', seguiré el tutorial que hay adjunto a los apuntes:

- Añadimos el repositorio de node.js:
    
    add-apt-repository ppa:chris-lea/node.js
    apt-get update

- Instalamos node.js

    apt-get install nodejs
    
- Instalar Azure con npm

    npm install azure-cli
    
IMG: INSTALACIONAZURE.PNG

pero la instalación no se realizó correctamente, por lo que buscando compañeros en la misma situación que yo encontré que José Manuel Colella añadió la opción -g al comando de la instalación, probando nuevamente con:

    npm install -g azure-cli
    
Esta vez la instalación si se llevo a cabo correctamente.



