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

1. terraform init

2. terraform plan

3. terraform apply --auto-approve

seguramente en la mayoria de los casos nos de un error comun, en el mismo error aparecera una URL, copiamos la url y la pegamos en nuestro navegador, deberemos habilitar el servicio al cual el error nos redirecciona en nuestro proyecto anteriormente creado en google cloud.
