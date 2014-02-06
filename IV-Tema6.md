# Tema 6 - Gestión de configuraciones
## Alumno: Sergio Muñoz Gamarra

## Ejercicio 1

Lo primero que tenemos que instalar en ruby, ya que es imprendincible para utilizar chef:

    sudo apt-get install ruby1.9.1 ruby1.9.1-dev rebygems
    
Y terminamos instalando chef con gem:

    sudo gem install ohai chef
    
## Ejercicio 2

Para este ejercicio voy a seguir el segundo tutorial que se adjunta en el enunciado del ejercicio.

Para empezar a utilizar Chef lo primero que tenemos que hacer es crear y configurar el directorio de uso de Chef, de la siguiente manera:

    mkdir -p ~/chef/cookbooks/nginx/recipes

Dentro de este directorio tendremos tendremos la receta '''default.rb'''
