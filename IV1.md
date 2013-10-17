Infraestructura Virtual

Alumno: Sergio Muñoz Gamarra


Ejercicio 1

	El servidor elegido ha sido un servidor HP Proliant de la tienda de informática Dynos, su precio es de 1645 €.

	Adem�s sabemos que para calcular el coste de amortización a cuatro años habrá que realizarle el 25% al precio del producto sin IVA, es decir, el precio de amortización:

	Amort = (1645 - 1645*0,21) * 0,25 = 324,8875 €/año

	Teniendo en cuenta que 100% entre 7 años es igual al 14,28%, la amortización a siete años será gual a:
	
	Amort7 = (1645 - 1645*0,21) * 0,1428 = 185,57574 €/año


Ejercicio 2

Para este ejercicio utilizaremos los precios de amazon y 1&1, por una parte tenemos los precios de servidores virtuales con las mismas características:
- Dinahost: 84,40 €/mes
- Amazon: 81,05 €/mes

y por otra parte tenemos los precios de servidores de alojamiento:
- Dinahost: 50,3 €/mes
- Amazon: 53,70 €/mes

Ejercicio 6

Una vez creado el proyecto desde la página de gitHub, marcando la opción de creación de fichero readme, lo clonamos en nuestro local desde la línea de comandos, utilizando git clone <url del proyecto>.
Para modificar el fichero Readme tan sólo hay que usar el comando touch readme.md.

Ejercicio 7

Cgroup nos proporciona la posibilidad de gestionar los recursos dados por la CPU, la memoria y I/O. Para la gestión se pueden utilizar dos métodos, o bien creamos grupos de control, o bien podemos utilizar el fichero /etc/cgconfig.conf dónde podemos crear una configuración persistente. En este caso vamos a utilizar la creación de grupos de control tal y como pide el enunciado del ejercicio.

Lo primero que debemos hacer es instalar los paquetes necesarios para utilizar cgroup:
		sudo apt-get install -y cgroup-bin

El enunciado nos pide crear tres grupos de control, uno para el navegador, otro para el editor de textos y otro a libre elección, así que he elegido python. Lo primero que tenemos que hacer es crear un grupo:

	sudo cgcreate -a sergio -g memory,cpu,cpuacct:ejercicio7

Dentro del grupo creamos tres subgrupos de control para cada uno de los apartados citados antes:

  	sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/browser
  	sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/editor
  	sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/python

Una vez que tenemos los subgrupos les asignamos sus aplicaciones y la ejecutamos:

	sudo cgexec -g memory,cpu,cpuacct:ejercicio7/browser firefox
	sudo cgexec -g memory,cpu,cpuacct:ejercicio7/editor gedit
	sudo cgexec -g memory,cpu,cpuacct:ejercicio7/python python

Tan solo nos queda comprobar los resultados dentro de los directorios de ejercicio7 dedicados a las tres aplicaciones, quedando los siguientes datos:





En este caso en el porcentaje de cpu debería aparecer cuanta cpu ha consumido cada procesador, en mi casa estoy usando una máquina virtual a la que solo hay asignada un cpu.



Ejercicio 8


El fichero que se ha de modificar para dicho fin es el fichero /etc/cgconfig.conf. Un ejemplo de creación de política restrictiva con los recursos sería la siguiente:

group UsuariosLimitados {
	cpu {
		cpu.shares = 30
	}
}

De este modo limitamos al 30% del uso de CPU a este grupo



