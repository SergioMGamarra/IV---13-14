# Introducción ligera a Ruby


## Ejercicio 1

Para la instalación de ruby en Ubuntu tan solo necesitaremos instralar los paquetes indicados en el enunciado:

    sudo apt-get install ruby irb rubygems rdoc
    
Una vez instalado comprobaremos que versión es con 'ruby --version'

![Ejercicio1](https://github.com/SergioMGamarra/IV---13-14/blob/master/Ruby-complem/Ejercicio1.png?raw=true)

## Ejercicio 2

El programa diseño mostrará una cantidad de líneas teniendo como límite una variable que contendrá el número límite. Dicho programa se basa en un bucle while:

    #! /usr/bin/ruby
    contador = 0
    lim = 10
    
    while (contador <= lim)
    	puts "Contador: #{contador} de #{lim}" 
    	contador += 1
    end

Obteniendo como salida:


## Ejercicio 3

La pregunta a la pregunta en sí, ya que no existen los tipos de variables por lo que la creación de estructuras es totalmente libre poniendo ser mixta. Como ejemplo tenemos el siguiente programa:
    
    #! /usr/bin/ruby

    array = {:dos_digitos => ['12', '14', '20'], :un_digito => ['1','8', '9']}
    
    array.keys().each do |i|
    	puts array[i]
    end


Obteniendo la siguiente salida:


## Ejercicio 4

En este programa lo que se podrá ver será la URL que se quiera utilizar, la fecha de envío de la petición y el servidor del sitio web que hayamos utilizado. Todo esto se consigue con el siguiente código:

    #!/usr/bin/ruby
    require 'net/http'

	def fecha()
		respuesta = Net::HTTP.get_response(ARGV[0], '/')
		return respuesta['date'].to_s
	end

    def servidor()
        respuesta = Net::HTTP.get_response(ARGV[0],'/')     
        return respuesta['server'].to_s
    end

    url = ARGV[0]
    puts "URL: " << url
    puts "Envío de la petición en: " << fecha()
    puts "Servidor: " << servidor()


Obteniendo la siguiente salida:


## Ejercicio 5

Para la instalación se usará el siguiente comando:

    sudo gem install vagrant
    
Y procederemos a comprobar que esta correctamente instalado con el comando:

    gem search --remote vagrant



