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
    
Ahora seguiremos los mismos pasos para la instalación del editor de texto vim:

- Creamos el directorio para vim:

    mkdir -p ~/chef/cookbooks/vim/recipes
    
- Dentro del directorio creamos la receta default.rb:

    package 'vim'
    
- Añadimsos a json la orden de que también se ejecute el contenido del directorio de vim:

    "run_list": [
        "recipe[nginx]",
        "recipe[vim]"
    ]

Como dictorio crearé una carpeta llamada facultad que contendrá un fichero llamado tareas.txt; para esta tarea seguiremos también los pasos anteriores:

- Creamos el directorio para vim:

    mkdir -p ~/chef/cookbooks/facultad/recipes
    
- Dentro del directorio creamos la receta default.rb:

    directory '/home/facultad'
    file "/home/facultad/tareas.txt" do
      owner "sergio"
      group "sergio"
      mode 00764
      action :create
      content "Tareas para el periodo de exámenes de Febrero 13/14"
    end

- Añadimsos a json la orden de que también se ejecute el contenido del directorio de vim:

    "run_list": [
        "recipe[nginx]",
        "recipe[vim]"
        "recipe[facultad]"
    ]


Tras tenerlo todo configurado en chef tan solo nos queda la ejecución del siguiente comando:

    sudo chef-solo -c chef/solo.rb
