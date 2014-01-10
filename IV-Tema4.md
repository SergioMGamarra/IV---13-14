# Ejercicios Tema 4 - Almacenamiento Virtual

Alumno: Sergio Muñoz Gamarra

# Ejercicio 1

La distribución de mi disco duro responde a la estructura que aparece en la siguiente imagen:

![Ejercicio1a](https://github.com/SergioMGamarra/IV---13-14/blob/master/imgTema4/ej1-a.png?raw=true)


En cuanto a los ordenadores de la facultad funcionan a través de un sistema de ficheros remoto, usando NFS para devolver los archivos de los usuarios.

# Ejercicio 2

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



# Ejercicio 3

Para este ejercicio crearé ficheros en formato img y en formato vmdk utilizando como herramienta la biblioteca qemu, y asignandoles un tamaño de 20MB, usando los siguientes comandos:

    
    qemu-img create -f vmdk vmdk.vmdk 20M
    qemu-img create -f raw img.img 20M
    
EJERCICIO3-CREARIMG

Y a continuación intenté montarlas pero al no estar formateado no es posible, usé:

     mount -o loop,offset=32256 img.img /mnt/
     mount -o loop,offset=32256 vmdk.vmdk /mnt/
    
los cuales me devolvieron el siguiente error:

    mount: debe especificar el tipo de sistema de archivos

    
    
