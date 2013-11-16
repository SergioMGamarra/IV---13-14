##Ejercicios Tema 3

#Ejercicio 1

Lo primero que tenemos que hacer para comenzar a trabajar este tema es la instalación de LXC, que utilizaremos para la creación de contenedores.

![Ejercicio1](https://www.dropbox.com/s/52dgpis1zur99hf/Ej1.png?raw=true)


#Ejercicio 2

A continuación vamos a crear un contenedor con LXC a partir del siguiente comando:

    sudo lxc-create -t ubuntu -n primeraCaja

y la arrancaremos con:

    sudo lxc-start --name primeraCaja
    
![Ejercicio2a](https://www.dropbox.com/s/0rnhq48etddqgjw/ej2-a.png?raw=true)
    
Una vez arrancado el contenedor vamos a comprobar que interfaces se han creado para el contenedor, para ello vamos a usar el comando:

    ip addr show
    
Como se puede observar en la siguiente imagen se han creado dos interfaces nuevas para el contenedor:

![Ejercicio2b](https://www.dropbox.com/s/5q7g49akchkl4pg/ej2-b.png?raw=true)

y a continuación vamos a buscar la existencia de nuevos puentes, con:

    sudo brtcl show
    
dando como resultado:

![Ejercicio2c](https://www.dropbox.com/s/w5v98wdmj4ao951/ejer2-c.png?raw=true)

y como podemos observar en la captura de pantalla se ha creado un puente. Dicho puente se ha creado con la función de dar conexión a internet al contenedor.

