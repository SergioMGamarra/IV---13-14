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

Dentro de este directorio tendremos tendremos la receta default.rb, que será:

    package 'nginx'


Una vez tenemos creada nuestro primera receta lo que haremos será configurar nuestro recetario, tan y como indican en el tutorial, creando y desarrollando nuestro fichero 'solo.rb' donde indicaremos dónde encontrar el fichero json y nuestro recetario:

    cookbook_path File.expand_path("~/chef/cookbooks",__FILE__)
    json_attribs File.expand_path("~/chef/cookbooks/node.json", __FILE__)
    
Ahora añadimos nuestro fichero json al directorio, donde configuraremos las ejecuciones de chef:

    {
        "run_list": [ "recipe[nginx]" ]
    }
    
y ejecutaremos la receta con el siguiente comando:

    sudo chef-solo -c chef/solo.rb
