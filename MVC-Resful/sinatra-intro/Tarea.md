Tarea MVC-RESFUL - José Daniel Zapata Ancco/20202230A
Configuración
  cd sinatra-intro/
  bundle install
  ruby template.rb # O: bundle exec ruby template.rb
Luego, ingresa el siguiente enlace en un navegador para ver la página web y verificar si está funcionando.

![image](https://github.com/Josezapat/CC3S2/assets/90808325/c9ae4f1f-b902-4e45-b882-a0db483c0410)

Sinatra nos ejecuta perfectamente en Gitbash

Luego ingresando al siguiente enlace en nuestro buscador web nos imprime el resultado de nuestro archivo template.rb
  http://localhost:4567/todos
  
  ![image](https://github.com/Josezapat/CC3S2/assets/90808325/cec4e9d1-406f-43f7-982a-1410e75f549a)

Además, prueba el siguiente comando usando 'curl' para verificar que la aplicación se esté ejecutando localmente y responda. El comando activa una solicitud GET para recuperar la lista de "cosas por hacer" y debería recibir una respuesta que se muestra en la salida estándar de la línea de comando.

  curl http://localhost:4567/todos
En los siguientes ejercicios, agregaremos más rutas y podrás continuar usando comandos curl con diferentes argumentos para verificar la corrección de sus comportamientos.

Objetivo: Tu tarea es implementar las partes del archivo denominado TU CODIGO AQUI. La referencia que contiene las soluciones se encuentra en el archivo final.rb.

**Parte 1**
Lo primero que vamos a hacer es crear un modelo. A diferencia de Rails, Sinatra no tiene MVC integrado, así que vamos a piratear el nuestro. Usaremos ActiveRecord sobre una base de datos SQLite. En esta aplicación, ¿cuál será nuestro modelo y qué operaciones CRUD le aplicaremos?

index: Esta operación se encarga de mostrar una lista de todas las tareas pendientes. 

create: Esta operación permite crear una nueva tarea pendiente.

read: Esta operación permite ver los detalles de una tarea específica. 

update: Esta operación permite actualizar una tarea existente. 

destroy: Esta operación permite eliminar una tarea. 

**Parte 2**
A continuación, creemos algunas rutas para que los usuarios puedan interactuar con la aplicación. Aquí hay una URL de ejemplo:

  https://www.etsy.com/search?q=test#copy
Primero, especifica qué partes de la URL son componentes según la discusión sobre la forma de una URL. Consulta esta publicación de IBM que detalla los componentes de una URL.

https:// : Este es el esquema de la URL.
etsy : Este es el nombre del host o dominio.
443 : Este es el número de puerto (predeterminado para HTTPS).
/search :Esta es la parte del camino o path de la URL.
q=test : Esto es un parámetro de consulta que se utiliza para enviar datos al servidor.
copy :Esto es un fragmento que generalmente se usa en el lado del cliente para navegación interna en una página web.

En Sinatra, el enrutamiento y el controlador están acoplados, lo que facilita la declaración de rutas. Declaramos algunas rutas RESTful para que podamos ver una lista de tareas pendientes, crear una tarea pendiente, editar una tarea pendiente y eliminar una tarea pendiente. ¿Qué acciones RESTful deberíamos utilizar para estos?

Ver una lista de tareas pendientes (Listar): Utiliza la acción GET en la ruta /todos.
Crear una tarea pendiente (Crear): Utiliza la acción POST en la ruta /todos.
Editar una tarea pendiente (Actualizar): Utiliza la acción PUT en la ruta /todos/:id, donde :id es el identificador único de la tarea.
Eliminar una tarea pendiente (Eliminar): Utiliza la acción DELETE en la ruta /todos/:id, donde :id es el identificador único de la tarea.

**Parte 3**
Dado que HTTP es un protocolo RESTful, cada solicitud debe ir seguida de una respuesta, por lo que debemos devolver una vista o redirigir a cada solicitud. Usaremos JSON para las respuestas, que es similar a lo que hacen muchas API. ¿Hacia dónde debería ir la respuesta?.

Listar (Listar tareas pendientes): Cuando un cliente realiza una solicitud GET a la ruta /todos, debes responder con un JSON que contenga la lista de tareas pendientes. Por ejemplo:
[
  { "id": 1, "description": "Hacer la compra" },
  { "id": 2, "description": "Estudiar para el examen" }
]

Crear (Crear tarea pendiente): Cuando un cliente realiza una solicitud POST a la ruta /todos para crear una nueva tarea pendiente, debes responder con un JSON que confirme la creación exitosa de la tarea. Por ejemplo:
{ "msg": "Tarea creada exitosamente" }

Actualizar (Editar tarea pendiente): Cuando un cliente realiza una solicitud PUT a la ruta /todos/:id para actualizar una tarea pendiente existente, debes responder con un JSON que confirme la actualización exitosa o informe sobre un error, como:

Actualización exitosa:
{ "msg": "Tarea actualizada exitosamente" }

Error (por ejemplo, si la tarea no se encuentra):
{ "msg": "Error: Tarea no encontrada" }

Eliminar (Eliminar tarea pendiente): Cuando un cliente realiza una solicitud DELETE a la ruta /todos/:id para eliminar una tarea pendiente existente, debes responder con un JSON que confirme la eliminación exitosa o informe sobre un error, como:

Eliminación exitosa:
{ "msg": "Tarea eliminada exitosamente" }

Error (por ejemplo, si la tarea no se encuentra):
{ "msg": "Error: Tarea no encontrada" }

