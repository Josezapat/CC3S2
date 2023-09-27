Configuración
  cd sinatra-intro/
  bundle install
  ruby template.rb # O: bundle exec ruby template.rb
Luego, ingresa el siguiente enlace en un navegador para ver la página web y verificar si está funcionando.

![image](https://github.com/Josezapat/CC3S2/assets/90808325/c9ae4f1f-b902-4e45-b882-a0db483c0410)

Sinatra nos ejecuta perfectamente en Gitbash

  http://localhost:4567/todos
Además, prueba el siguiente comando usando 'curl' para verificar que la aplicación se esté ejecutando localmente y responda. El comando activa una solicitud GET para recuperar la lista de "cosas por hacer" y debería recibir una respuesta que se muestra en la salida estándar de la línea de comando.

  curl http://localhost:4567/todos
En los siguientes ejercicios, agregaremos más rutas y podrás continuar usando comandos curl con diferentes argumentos para verificar la corrección de sus comportamientos.

Objetivo: Tu tarea es implementar las partes del archivo denominado TU CODIGO AQUI. La referencia que contiene las soluciones se encuentra en el archivo final.rb.

Parte 1
Lo primero que vamos a hacer es crear un modelo. A diferencia de Rails, Sinatra no tiene MVC integrado, así que vamos a piratear el nuestro. Usaremos ActiveRecord sobre una base de datos SQLite. En esta aplicación, ¿cuál será nuestro modelo y qué operaciones CRUD le aplicaremos?

index:
create:
read:
update:
destroy
