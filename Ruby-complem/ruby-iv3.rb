#! /usr/bin/ruby

# Autor: Sergio Muñoz
# Descripción: Ejercicio 3 del seminario de Ruby (IV 13/14)

# Declaración de variable
array = {:dos_digitos => ['12', '14', '20'], :un_digito => ['1','8', '9']}

array.keys().each do |i|
	puts array[i]
end
