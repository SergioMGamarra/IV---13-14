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

```
    cookbook_path File.expand_path("~/chef/cookbooks",__FILE__)
    json_attribs File.expand_path("~/chef/cookbooks/node.json", __FILE__)
```    
    
Ahora añadimos nuestro fichero json al directorio, donde configuraremos las ejecuciones de chef:


```json
    {
        "run_list": [ "recipe[nginx]" ]
    }
```

    
Ahora seguiremos los mismos pasos para la instalación del editor de texto vim:

- Creamos el directorio para vim:

```sh
    mkdir -p ~/chef/cookbooks/vim/recipes
```

    
- Dentro del directorio creamos la receta default.rb:

```ruby
    package 'vim'
```

    
- Añadimsos a json la orden de que también se ejecute el contenido del directorio de vim:

```json
    "run_list": [
        "recipe[nginx]",
        "recipe[vim]"
    ]
```


Como dictorio crearé una carpeta llamada facultad que contendrá un fichero llamado tareas.txt; para esta tarea seguiremos también los pasos anteriores:

- Creamos el directorio para vim:

```sh
    mkdir -p ~/chef/cookbooks/facultad/recipes
```


- Dentro del directorio creamos la receta default.rb:

```ruby
    directory '/home/facultad'
    file "/home/facultad/tareas.txt" do
      owner "sergio"
      group "sergio"
      mode 00764
      action :create
      content "Tareas para el periodo de exámenes de Febrero 13/14"
    end
```


- Añadimsos a json la orden de que también se ejecute el contenido del directorio de facultad:

```json
    "run_list": [
        "recipe[nginx]",
        "recipe[vim]",
        "recipe[facultad]"
    ]
```


Tras tenerlo todo configurado en chef tan solo nos queda la ejecución del siguiente comando:

```sh
    sudo chef-solo -c chef/solo.rb
```


Tras finalizar la ejecución correctamente:

IMG: 2-chefFinal.png

Y vemos que todo ha sido instalado correctamente:

IMG: chefFuncionaaa.png


## Ejercicio 3

```yaml
    - uno: "dos"
      tres:
        - 4
        - 5
        - "Seis"
        -
          - siete: 8
            nueve: 
              - 10
              - 11
```

## Ejercicio 4

Lo primero que tenemos que hacer para este ejercicio es crear una máquina virtual en azure:


```sh
azure vm create sergioansible b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu_DAILY_BUILD-saucy-13_10-amd64-server-20140209-en-us-30GB sergiogamarra CONTRASEÑA --location "West Europe" --ssh
```

Una vez instalada comprobamos que funciona bien a través de la interfaz web y probando que tenemos acceso a través de SSH.

```sh
ssh sergiogamarra@sergioansible.cloudapp.net
```

Una vez sabemos que tenemos acceso a la MV el siguiente paso será instalar ansible en nuestro ordenador:

```sh
sudo apt-get install ansible
```

y crearemos un fichero donde le indicaremos a ansible el host que debe utilizar y a partir de este archivo que contendrá ```[aure]sergioansible.cloudapp.net``` y le indicaremos a ansible que ese será el host que debe utilizar:

```
 export ANSIBLE_HOSTS=~/ansible_hosts
```

Una vez que ansible sabe la dirección del host a utilizar instalaré en la máquina virtual la sshpass necesario para la conexión con ansible:

```sh
sudo apt-get install sshpass
```

Ya tan solo nos quedará clonar el repositorio con nuestra maquina virtual, con el siguiente comando:

```sh
ansible azure -m git -a "https://github.com/SergioMGamarra/pythonBasico.git dest=~/ version=HEAD"
```

Una vez que el repositorio ya tendremos nuestra aplicación en la MV.


## Ejercicio 6

Lo primero que debemos hacer es instalar vagrant en nuestra máquina anfitriona

```sh
sudo apt-get install vagrant
```

Lo que debemos hacer ahora es buscar una máquina virtual que se adapte a nuestras exigencias en la página de vagrant: www.vagrantbox.com. En mi caso voy a usar Debian Wheezy 7.0 amd64 (British) Puppet 3.2.1, Chef 11.4.4, built with Veewee 0.3.7; por lo que una vez elegida seguiremos los siguientes pasos:

```sh
vagrant box add Wheezy http://vagrantboxes.footballradar.com/wheezy64.box
vagrant init Wheezy
```

Después de esto podemos ver que se ha creado un archivo llamado ```Vagrantfile``` en el directorio donde lo hemos descargado. Este directorio se utilizará para la configuración, pero en principio tan solo necesitaremos indicar el nombre del archivo .box, que ya viene hecho por defecto, quedando así:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "Wheezy"
end
```

Una vez descargada y puesta a punto lo que vamos a hacer va a ser iniciarla y comprobar el correcto funcionamiento:

```sh
vagrant up
vagrant ssh
```

IMG:VAGRANTFUNCIONANDO.PNG


## Ejercicio 7

Lo que haremos será modificar el fichero Vagrantfile, y usaremos inline de forma que podremos introducir comandos shell, y lo que haremos será instalar el paquete nginx y reiniciaremos el servicio una vez instalado. El fichero quedará así:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sergio"

  config.vm.provision "shell",
  inline: "sudo apt-get install -y nginx && sudo service nginx restart"

end
```

Y ejecutaremos el comando ```Vagrant provision```.
