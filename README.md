# google-cloud-terraform
Desplegamos una instancia con un nginx instalado que sale a internet a traves de su Load Balancer

REQUISITOS:
---------------------------------------------------
  1. iniciar un proyecto nuevo en google cloud
  2. descargarnos el account.json
  3. cambiar el nombre de proyecto del archivo main.tf 
---------------------------------------------------
todo esto se ejecutara a traves de terraform

para ello deberemos instalar terraform

una vez instalado terraform tendremos que descarganos el repositorio

cuando tengamos descargado el repositorio en nuestra maquina entramos a la carpeta del repositorio descargado

deberemos colocar nuestro account.json en la raiz de la carpeta

cuando tengamos el account.json deberemos ejecutar

1. terraform init -- iniciamos el proyecto a desplegar

2. terraform plan -- comprobamos que vamos a crear con nuestros ficheros .tf

3. terraform apply --auto-approve -- desplegamos el proyecto entero con una autoaprobación

seguramente en la mayoria de los casos nos de un error comun, en el mismo error aparecera una URL, copiamos la url y la pegamos en nuestro navegador, deberemos habilitar el servicio al cual el error nos redirecciona en nuestro proyecto anteriormente creado en google cloud.

REPETIMOS EL APPLY 

si todo a salido correctamente debereis tener en el output del terminal la dirección IP por la cual veremos nuestro WELCOME NGINX.
