Infraestructura Virtual

Alumno: Sergio Muñoz Gamarra


Ejercicio 1

El servidor elegido ha sido un servidor HP Proliant de la tienda de informática Dynos, su precio es de 1645 €.

Además sabemos que para calcular el coste de amortización a cuatro años habrá que realizarle el 25% al precio del producto sin IVA, es decir, el precio de amortización:

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

Ejercicio 5

Para la instalación solamente debemos ejecutar el siguiente comando:
	sudo apt-get install git

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

					Gedit			Firefox			Python

	cpuacct.stat			user 23 system 27	user 97 system 566	user: 405 system: 51

	cpuacct.usage			564098477		18306743320		4761160601

	cpuacct.usage_percpu		564098477		18306743320		4761160601

	memory.max_usage_in_bytes	11563008		262348800		77271040


En este caso en el porcentaje de cpu debería aparecer cuanta cpu ha consumido cada procesador, en mi casa estoy usando una máquina virtual a la que solo hay asignada un cpu.



Ejercicio 8


El fichero que se ha de modificar para dicho fin es el fichero /etc/cgconfig.conf. Un ejemplo de creación de política restrictiva con los recursos sería la siguiente:

	group UsuariosLimitados {
		cpu {
			cpu.shares = 30
		}
	}

De este modo limitamos al 30% del uso de CPU a este grupo

Ejercicio 9

Lo primero que haremos será buscar la información de nuestro procesador en el fichero /proc/cpuinfo. De este fichero hemos obtenido la siguiente información:
Procesador Intel i5 2.40GHz cada uno

Los flags que me apareceren para cada procesador son los siguientes:

	flags   	 : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
	flags   	 : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
	flags   	 : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
	flags   	 : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid


Ejercicio 10

Para utilizar kvm-ok lo primero que debemos hacer es instalar el paquete cpu-checker (sudo apt-get install cpu-checker). Una vez instalado el paquete podemos utilzar el comando 'kmv-ok'.
A partir de este comando obtenemos:
	
	INFO: /dev/kvm does not exist
	HINT:   sudo modprobe kvm_intel
	INFO: For more detailed results, you should run this as root
	HINT:   sudo /usr/sbin/kvm-ok

Lo que quiere decir que en mi caso el módulo módulo KVM NO está activo.

Ejercicio 12

En este ejercicio el entorno virtual de programación elegido es virtualenv para Python. La instalación es sencilla, tan solo debemos ejecutar el siguiente comando:

	pip3 install virtualenv
	
Una vez instalado solo quedará arrancarlo con:

	virtualenv ENV
