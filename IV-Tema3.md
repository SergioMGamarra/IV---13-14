#Ejercicios Tema 3

##Ejercicio 1

Lo primero que tenemos que hacer para comenzar a trabajar este tema es la instalación de LXC, que utilizaremos para la creación de contenedores.

![Ejercicio1](https://github.com/SergioMGamarra/IV---13-14/blob/master/imgTema3/Ej1.png?raw=true)

##Ejercicio 2

A continuación vamos a crear un contenedor con LXC a partir del siguiente comando:

    sudo lxc-create -t ubuntu -n primeraCaja

y la arrancaremos con:

    sudo lxc-start --name primeraCaja
    
![Ejercicio2a](https://github.com/SergioMGamarra/IV---13-14/blob/master/imgTema3/ej2-a.png?raw=true)

Una vez arrancado el contenedor vamos a comprobar que interfaces se han creado para el contenedor, para ello vamos a usar el comando:

    ip addr show
    
Como se puede observar en la siguiente imagen se han creado dos interfaces nuevas para el contenedor:

![Ejercicio2b](https://github.com/SergioMGamarra/IV---13-14/blob/master/imgTema3/ej2-b.png?raw=true)

y a continuación vamos a buscar la existencia de nuevos puentes, con:

    sudo brtcl show
    
dando como resultado:

![Ejercicio2c](https://github.com/SergioMGamarra/IV---13-14/blob/master/imgTema3/ejer2-c.png?raw=true)

y como podemos observar en la captura de pantalla se ha creado un puente. Dicho puente se ha creado con la función de dar conexión a internet al contenedor.


##Ejercicio 3

Para crear un contenedor basado en Debian vamos e ejecutar el siguiente comando:
    
    lxc-create -n ContDebian -t debian
    
Tras instalarlo, tan sólo quedará ver si se creó correctamente con:

    lxc-start -n ContDebian
    
Tras la ejecución de este comando tendremos lanzado nuestro contenedor.
Información adicional: Es importante saber que el login y el password que se crean por defecto es root, tanto para el password como para el nombre de usuario.

Para la segunda parte, para instalar un contenedor Fedora en un sistema Debian se utilizará el siguiente comando:

    lxc-create -t fedora -n ContFedora
    
Al lanzar dicho comando nos aparecerá un aviso de que es necesario tener instalados los paquetes yum y curl; así que antes de volver a intertar crear el contenedor Fedora lo primero que debemos lanzar es la instalación de dichos paquetes:

    apt-get install yum curl
    
Tras la creación del contenedor tan solo nos faltará comprobar su correcto funcionamiento arrancandolo con el siguiente comando:

    lxc-start -n ContFedora
    
Al igual que en el caso del contenedor Debian tanto el usuario como la contraseña serán root por defecto. En la siguiente captura de pantalla perteneciente al ejercicio 4 podremos ver como ambos contenedores están en funcionamiento.

##Ejercicio 4

Para instalar lxc-webpanel vamos a utilizar los siguientes comandos:

    sudo su
    sudo wget http://lxc-webpanel.github.io/tools/install.sh -O - | bash
    
Una vez instalada vamos a utilizarla introduciendo en el navegador la siguiente dirección, teniendo en cuenta que el usuario y la contraseña serán 'admin':

    http://localhost:5000
    
Como podemos ver en esta primera captura de pantalla desde la página principal podremos visualizar los recursos que se están consumiendo, los contendores que tenemos creados y cuales de ellos están en funcionamiento.
La primera gran utilidad que se le encuentra a esta herramienta es la de iniciar, parar o pausar cualquier contenedor.
Como se puede ver en la captura de pantalla anterior tengo en iniciadas los dos contenedores del ejercicio anterior.

Otra de las utilidades de esta herramienta es la restricción de recursos. En mi caso para realizar el ejercicio voy a limitar los recursos al contenedor Fedora del ejercicio anterior, de la siguiente forma:


##Ejercicio 6

Lo primero que debemos es añadir el repositorio de juju:

    sudo add-apt-repository ppa:juju/stable
    
Tras actualizar vamos a instalar el paquete de juju:

    sudo apt-get install juju-core juju juju-local
    
A continuación estableceremos local como sistema por defecto:

    sudo nano /root/.juju/enviroment

Dentro de dicho fichero estableceremos local por defecto:

EJERCICIO6-1.PNG

En mi caso ya tengo instalado MongoDB, pero en caso de no tenerlo debemos instalarlo con:

    sudo apt-get install mongodb-server
    


##Ejercicio 8

Lo primero que tenemos que hacer es instalar el cpu-checker,kvm y libvirt para tener disponible kvm-ok:

    sudo apt-get install cpu-checker kvm libvirt-bin

Y tenemos que agregar un usuario con:

    sudo adduser $USER libvirtd
    

##Ejercicio 9

Para utilizar virt-install lo único que necesitaremos será instalar libvirt y algunos de sus complementos, para lo que usaremos el siguiente comando:

    sudo apt-get install libvirt-bin virt-viewer virtinst 
    
Una vez instalado instalaremos un contenedor con el siguiente comando:

    sudo virt-install --name virtInstall --ram 256 --file=/home/sergio/Escritorio/virtInstall/ubuntu-13.10-desktop-amd64.img --file-size=1 --cdrom=/home/sergio/Escritorio/virtInstall/ubuntu-13.10-desktop-amd64.iso
    
    


