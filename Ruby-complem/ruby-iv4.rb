#!/usr/bin/ruby

# Autor: Sergio Muñoz
# Programa para el ejercicio 4 de la introdución a Ruby 

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

