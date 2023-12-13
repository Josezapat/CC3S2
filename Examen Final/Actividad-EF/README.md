Examen Final
José Daniel Zapata Ancco / 20202230A
Parte 1
Estas preguntas corresponden a las actividades desarrolladas en clase.

1.	Produce un conflicto de fusión (merge) en algún repositorio de tus actividades realizadas. Establece los pasos y comandos que usas para resolver un conflicto de fusión en Git. Si intentas git push y falla con un mensaje como : Non-fast-forward (error): failed to push some refs esto significa que algún archivo contiene un conflicto de fusión entre la versión de tu repositorio y la versión del repositorio origen. Para este ejercicio debes presentar el conflicto dado, los pasos y comandos para resolver el problema y las solución.

- Si es verdad, algunas veces cuando estoy subiendo un git push origin main desde mi computadora local hacia mi repositorio de github se me ha abierto automáticamente un Archivo llamado MERGE en Visual Studio Code, el cual sirve para escribir en texto los cambios que se van hacer al subir el repositorio actualizaco, yo lo que hago es simplemente cerrar ese archivo MERGE y el git bash seguirá funcionando normalmente.

Los Archivos los estoy utilizando desde la carpeta Ajax de mi rapositorio: https://github.com/Josezapat/CC3S2/tree/main/Ajax

2.1. ¿Qué pasa si tenemos @user sin nombre de usuario y llamamos a @user.valid? ¿Qué guardará @user.save?
Si tenemos un objeto @user sin un nombre de usuario y llamo a @user.valid?, se ejecutarán las validaciones definidas en el modelo User. En este caso, la validación validates :username, :presence => true garantiza que el campo username no esté en blanco. Por lo tanto, @user.valid? devolverá false porque la validación de presencia no se cumple.

Si intentamos guardar el objeto @user con @user.save, el método save devolverá false porque la validación falló. Además, los errores de validación estarán disponibles en @user.errors.
Creamos un nuevo objeto @user con los parámetros proporcionados.
Intentamos guardar el objeto @user usando @user.save.
Si la validación es exitosa, redirigimos al usuario a la página del usuario recién creado.
Si hay errores de validación, mostramos los mensajes de error en la consola y volvemos a renderizar la acción new para permitir al usuario corregir los errores

Creamos al usuario 
```ruby
@user = User.new
```
Llamamos al método valid? en el objeto @user para verificar su validez según las validaciones definidas:

```ruby
@user.valid?
```

Intento guardar el objeto
```ruby
@user.save
```

Verifico los errores
```ruby
puts @user.errors.full_messages
```

![image](https://github.com/Josezapat/CC3S2/assets/90808325/34cc6524-8151-4805-bd8e-006d50447efe)

2.2.
Creamos User .rb:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/6479e883-f0e8-4bc0-b4f8-c354c9cc2ff9)

el método username_format realiza la validación personalizada utilizando una expresión regular:
\A[a-zA-Z]: Asegura que el nombre de usuario comience con una letra.
[a-zA-Z0-9_]{0,9}: Permite letras, números y guiones bajos después del primer carácter, lo limitamos con longitud a un máximo de 10 caracteres.

![image](https://github.com/Josezapat/CC3S2/assets/90808325/ea6b6da3-20c9-442e-bfd5-09cb977f7a13)

Nos sale un error de un mensaje que indica que el nombre de usuario debe comenzar con una letra y tener como máximo 10 caracteres.


Creamos el archivo admin_controller.rb

![image](https://github.com/Josezapat/CC3S2/assets/90808325/00316b56-d1ff-4a58-9ef8-c73ea8ede951)

![image](https://github.com/Josezapat/CC3S2/assets/90808325/ce6def67-d381-41f3-a5ac-793bb13e2e81)

En este código, el método check_admin se ejecutará antes de cada acción en AdminController. Se verifica si el campo admin del objeto @user es true. Si no lo es, se establece un mensaje de alerta en el flash y se redirige a la página admin_login. 

4.
Para realizar una solicitud HTTP POST utilizando jQuery cuando se envía el formulario, puedes utilizar la función $.ajax().
Hacemos las pruebas necesarias para hacer funcionar el archivo Actividad-EF

![image](https://github.com/Josezapat/CC3S2/assets/90808325/bb6c082f-44bb-4527-88b9-8cee74c5db23)

![image](https://github.com/Josezapat/CC3S2/assets/90808325/b8c0ad0a-c7e7-4794-a9da-091e46bb7844)

Completamos el código el nuestro archivo index-html.etb:
```html
<!-- This file is app/views/movies/index.html.erb -->
<h2>All Movies</h2>

<div class="row navigation">
  <div class="col-md-10">
    <%= form_tag movies_path, method: :get, id: 'ratings_form' do %>
      <%= hidden_field_tag 'sort_by', @sort_by %>
      Include:
      <% @all_ratings.each do |rating| %>
        <div class="form-check  form-check-inline">
          <%= label_tag "ratings[#{rating}]", rating, class: 'form-check-label' %>
          <%= check_box_tag "ratings[#{rating}]", '1', (@ratings_to_show_hash.include?(rating)),
            class: 'form-check-input' %>
        </div>
      <% end %>
      <%= submit_tag 'Refresh', id: 'ratings_submit', class: 'btn btn-primary' %>
    <% end %>
  </div>
  <div class="col-md-2">
    <!-- Agrega el formulario de inicio de sesión -->
    <form method="POST" id="loginForm">
      <input type="text" class="user" placeholder="Username" />
      <input type="password" class="pass" placeholder="Password" />
      <input type="button" value="Log in" id="onSubmit" />
    </form>

    <!-- Incluye jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!-- Tu código jQuery -->
    <script>
      $("#onSubmit").click(function() {
        // Obtener los valores del formulario
        var username = $(".user").val();
        var password = $(".pass").val();

        // Realizar la solicitud HTTP POST
        $.ajax({
          url: '/ruta/del/servicio', // Reemplaza con la URL real de tu servicio
          method: 'POST',
          data: {
            username: username,
            password: password
          },
          success: function(response) {
            // Función de devolución de llamada (callback) para manejar la respuesta exitosa
            console.log('Éxito:', response);
          },
          error: function(error) {
            // Función de devolución de llamada (callback) para manejar errores
            console.error('Error:', error);
          }
        });
      });
    </script>
  </div>
</div>

<table class="table table-striped col-md-12" id="movies">
  <thead>
    <tr>
      <th>
        <%= link_to 'Movie Title', movies_path({sort_by: 'title', ratings: @ratings_to_show_hash}),
                      id: 'title_header', class: ('bg-warning hilite' if @sort_by == 'title') %>
      </th>
      <th>Rating</th>
      <th>
        <%= link_to 'Release Date',
              movies_path({sort_by: 'release_date', ratings: @ratings_to_show_hash}),
              id: 'release_date_header', class: ('bg-warning hilite' if @sort_by == 'release_date') %>
      </th>
      <th>More Info</th>
    </tr>
  </thead>
  <tbody>
    <% @movies.each do |movie| %>
      <tr>
        <td>
          <%= movie.title %>
        </td>
        <td>
          <%= movie.rating %>
        </td>
        <td>
          <%= movie.release_date %>
        </td>
        <td>
          <%= link_to "More about #{movie.title}", movie_path(movie) %>
        </td>
      </tr>
    <% end %>
  </tbody>
</table>

<%= link_to 'Add new movie', new_movie_path, class: 'btn btn-primary' %>
```

Ejecutamos el proyecto con 'rails server'
y nos abrirá un browser:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/6339595f-3dc4-4d3c-9731-1a441355f65c)

Donde agregamos en la interfaz para poner el username y pasword:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/2dbf58c3-1c96-4ace-b514-2b28635f9df8)

