# Ejercicios Tema 4 - Almacenamiento Virtual

Alumno: Sergio Muñoz Gamarra

# Ejercicio 1

La distribución de mi disco duro responde a la estructura que aparece en la siguiente imagen:

![Ejercicio1a](https://github.com/SergioMGamarra/IV---13-14/blob/master/imgTema4/ej1-a.png?raw=true)


En cuanto a los ordenadores de la facultad funcionan a través de un sistema de ficheros remoto, usando NFS para devolver los archivos de los usuarios.

# Ejercicio 2

Para este ejercicio lo primero que tendremos que hacer es crear un contenedor, este contenedor debe además tener instalado sshfs fuse:

    lxc-create -t debian -n ContDebian
    lxc-start -n ContDebian
    apt-get install sshfs fuse
    
Además instalaremos sshfs en nuestro local con el comando anterior.
Una vez instalados los paquetes necesitamos saber la IP del contenedor, en mi caso: 10.0.3.24
