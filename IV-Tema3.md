#Ejercicios Tema 3

##Ejercicio 1

Lo primero que tenemos que hacer para comenzar a trabajar este tema es la instalación de LXC, que utilizaremos para la creación de contenedores.

![Ejercicio1](https://dl-web.dropbox.com/get/IV/Tema3/Ej1.png?w=AAAzIAzRminrXiiNFghXiBSCW6YK_sgvOVIqOVapO0al-w)

##Ejercicio 2

A continuación vamos a crear un contenedor con LXC a partir del siguiente comando:

    sudo lxc-create -t ubuntu -n primeraCaja

y la arrancaremos con:

    sudo lxc-start --name primeraCaja
    
![Ejercicio2a](https://dl-web.dropbox.com/get/IV/Tema3/ej2-a.png?w=AABFUjBWVLNYXdFYQ5ZRyhJkxahB7GLxBbRixqFntK1_EA)

Una vez arrancado el contenedor vamos a comprobar que interfaces se han creado para el contenedor, para ello vamos a usar el comando:

    ip addr show
    
Como se puede observar en la siguiente imagen se han creado dos interfaces nuevas para el contenedor:

![Ejercicio2b](https://dl-web.dropbox.com/get/IV/Tema3/ej2-b.png?w=AABZ_6x-50H1MjuVQMbHRG8T3hTGXD4KzMB5tFJq4ucYPA)

y a continuación vamos a buscar la existencia de nuevos puentes, con:

    sudo brtcl show
    
dando como resultado:

![Ejercicio2c](https://dl-web.dropbox.com/get/IV/Tema3/ejer2-c.png?w=AAAHY1PpXdCRWUaJ5qU0MGAcEI9laI0iTsTQ4nYDgVbKoA)

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
    
Al igual que en el caso del contenedor Debian tanto el usuario como la contraseña serán root por defecto.

