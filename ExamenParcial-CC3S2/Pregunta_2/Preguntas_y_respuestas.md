***
Creamos una nueva aplicación Rails llamada "todo_app,"

```bash
rails new todo_app
cd todo_app
```

Obtenemos la creación de la app en nuestro terminal git:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/2923ff5a-2fbd-4abc-9c50-22f5b21d7b1a)

Este resultado detalla los archivos y gemas que se instalaron. Si ejecutas ls, deberías ver un nuevo directorio llamado "todo_app".
Ejecutamos "ls" y obtenemos:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/f2ef0397-2d41-42e3-8904-ca2d5b5e7658)

![image](https://github.com/Josezapat/CC3S2/assets/90808325/1739555a-c430-4578-8861-92814122f432)

Cambie el directorio a "todo_app", luego escriba e ingrese lo siguiente en el símbolo del sistema:

>> rails generate scaffold todo description:string
Ejecutamos el comando:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/accb3c3d-ec27-4bd5-a27a-198917b2f35f)

***
Base de datos

Bien, ahora que tenemos un modelo, creemos una base de datos para que podamos conservar cualquier información que la aplicación quiera almacenar. Sin crear una base de datos, ningún cambio que realicemos se registrará en el esquema de la base de datos. Puedes considerar este paso como construir la conexión entre el modelo y la base de datos del diagrama general. Aún dentro de la raíz del directorio "todo_app", escriba e ingresa lo siguiente en el símbolo del sistema (recuerda la versión de tu trabajo):

>> bundle exec rake db:migrate
Ejecutamos el comando:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/d15702d0-7642-49f4-80ef-a66a6877804f)

De acuerdo. Ahora que tenemos la base de datos, ¡insertemos algunos registros! Abre db/seeds.rb en un editor de texto de tu elección, luego pega las dos líneas siguientes en la parte inferior del archivo, debajo de los comentarios:

Todo.create(description: "Hello CC3S2- Kids")

Todo.create(description: " Do the assignments kid ")

Luego inserta los datos en la base de datos. Comprueba si los registros se insertaron correctamente en la base de datos.

Puede ejecutar el servidor de rails para iniciar el servidor y ejecutar tu aplicación. Realiza eso y muestra evidencias.


Insertamos nuestra base de datos en el archivo seeds.rb

```ruby
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Todo.create(description: "Hello CC3S2- Kids")

Todo.create(description: " Do the assignments kid ")
```
Ejecutamos el comando rails server para abrir nuestro servidor de rails:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/63eec5e9-d655-46ca-a5f4-026c712cd314)

Obtenemos una URL http://127.0.0.1:3000

![image](https://github.com/Josezapat/CC3S2/assets/90808325/fb002bad-4e67-402a-93eb-057c8efc0d31)

Generamos más migraciones:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/0a69e253-dc27-44ae-9d84-d0388077ac4b)

1. Agrega una ruta en config/routes.rb y asígnela a una acción del controlador. (Coloca esta línea dentro del cuerpo de route.draw).

```ruby
  get '/hello', to: 'todos#hello'
```
2. Añade una nueva vista correspondiente a la ruta. Si alguien navega a la página "hello" de tu aplicación (es decir, http://localhost:<número de puerto>/hello/), se mostrará una página web.

· Crea un archivo en el directorio app/views/todos llamado hello.html.erb.

· Puedes ingresar cualquier HTML que desees para mostrar tu página web, pero por ahora solo puedes escribir <h1>¡Hola!</h1>.

Ejecutamos rails server y vamos a la URL http://127.0.0.1:3000/hello:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/dbc1aa44-ac18-43f6-a2a9-fbadb7e51ae3)

***
Más ejercicios

· Agrega un nuevo atributo al modelo Todo y actualiza las vistas para mostrar y editar el nuevo campo. Para propósitos de práctica digamos que queremos agregar un nuevo campo booleano llamado "done" con un valor predeterminado de falso.

Implementamos en db/migrate:

```ruby
class AddDoneToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :done, :boolean, default: false
  end
end
```
Y ejecutamos el comando 

```bas
rake db:migrate
```
Y ahora se agregará el nuevo campo "done" a la tabla de la base de datos.

· Cambia el esquema de enrutamiento. Debes suponer que queremos una nueva ruta new_todo para ir a una página que crea un nuevo ítem Todo



· Establece todos#index como la página de inicio de la aplicación.

· Enumera todas las migraciones. ¿Cuál es el comando para volver a una versión anterior de la base de datos?. Muestra los resultados.
