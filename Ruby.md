# Introducción ligera a Ruby


## Ejercicio 1

Para la instalación de ruby en Ubuntu tan solo necesitaremos instralar los paquetes indicados en el enunciado:

    sudo apt-get install ruby irb rubygems rdoc
    
Una vez instalado comprobaremos que versión es con 'ruby --version'


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
    
    !# /usr/bin/ruby
    
    array = { :numeros_un_digito => ['1','3','7','9','2'],
    		  :numeros_dos_digitos => ['23','43','76','89','12'],
    		  :numeros_tres_digitos => ['234','765','978','345','234']
    		}
    
    puts array.inspect

Obteniendo la siguiente salida:


