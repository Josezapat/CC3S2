José Daniel Zapata Ancco / 20202230A Práctica Calificada N°2
***
**Parte 1 Algoritmos, Programación Orientada a Objetos**
**1.1**
```ruby
def encontrar_letra_faltante(cadena)
  alfabeto = "abcdefghijklmnopqrstuvwxyz"
  letras = cadena.downcase.scan(/[a-z]/)
  letras_faltantes = alfabeto.chars - letras
  letras_faltantes.first
end

cadena = "the quick brown box jumps over a lazy dog"
letra_faltante = encontrar_letra_faltante(cadena)
puts "La letra que falta es: #{letra_faltante}"
```
- Definimos la función encontrar_letra_faltante
- Declaramos el alfabeto: alfabeto = "abcdefghijklmnopqrstuvwxyz"
- Extraemos las letras existentes: letras = cadena.downcase.scan(/[a-z]/)
- Luego encontramos las letras faltantes con: letras_faltantes = alfabeto.chars - letras
- Por ultimo obtenemos la letra faltante: letras_faltantes.first
![image](https://github.com/Josezapat/CC3S2/assets/90808325/59b3d87d-d4c3-4af9-8992-890fdb912da8)

Podemos escribir cualquier cadena dentro de "cadena" y letra faltante será la primera letra que falte del albfabeto dentro de la "cadena".

**1.2**
```ruby
class ArbolBinario
  include Enumerable

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def <<(elemento)
    if elemento <= value
      if left.nil?
        @left = ArbolBinario.new(elemento)
      else
        left << elemento
      end
    else
      if right.nil?
        @right = ArbolBinario.new(elemento)
      else
        right << elemento
      end
    end
  end

  def empty?
    value.nil? && left.nil? && right.nil?
  end

  def each(&block)
    left.each(&block) if left
    yield(value)
    right.each(&block) if right
  end
end

# Ejemplo de uso
Arbol = ArbolBinario.new(10)
[5, 15, 2, 7, 12, 17].each { |elemento| Arbol << elemento }

puts "Elementos del árbol en orden:"
Arbol.each { |elemento| puts elemento }

puts "¿El árbol está vacío? #{Arbol.empty?}"

```

- Se incluye el módulo Enumerable para habilitar la iteración sobre instancias de la clase.
- La clase tiene tres atributos: value (valor del nodo actual), left (subárbol izquierdo), y right (subárbol derecho).
- El constructor initialize crea un nuevo nodo del árbol binario con un valor dado y establece los subárboles izquierdo y derecho como nulos.
- El método empty? verifica si el árbol está vacío, es decir, si el nodo actual y ambos subárboles son nulos.
- El método each se utiliza para recorrer los elementos del árbol en orden.

![image](https://github.com/Josezapat/CC3S2/assets/90808325/8fe36ee7-bd20-4855-a31d-c222addbe395)

Los elementos del árbol se imprimen en orden ascendente (2, 5, 7, 10, 12, 15, 17) debido a que es un árbol binario de búsqueda. Además, se confirma que el árbol no está vacío (valor "false") ya que se agregaron elementos a él.

**1.3**

```ruby
class ArbolBinario
  include Enumerable

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def <<(elemento)
    if elemento <= value
      if left.nil?
        @left = ArbolBinario.new(elemento)
      else
        left << elemento
      end
    else
      if right.nil?
        @right = ArbolBinario.new(elemento)
      else
        right << elemento
      end
    end
  end

  def empty?
    value.nil? && left.nil? && right.nil?
  end

  def each(&block)
    left.each(&block) if left
    yield(value)
    right.each(&block) if right
  end

  def include?(elt, &block)
    return true if value == elt
    left.include?(elt, &block) if left && (block.nil? || block.call(value, elt) == 0)
    right.include?(elt, &block) if right && (block.nil? || block.call(value, elt) == 0)
    false
  end

  def all?(&block)
    return false unless block.call(value)
    left.all?(&block) if left
    right.all?(&block) if right
    true
  end

  def any?(&block)
    return true if block.call(value)
    left.any?(&block) if left
    right.any?(&block) if right
    false
  end

  def sort
    sorted = []
    sorted += left.sort if left
    sorted << value
    sorted += right.sort if right
    sorted
  end
end
```
- La clase ArbolBinario tiene los métodos include?, all?, any?, y sort
- Se agregaron métodos adicionales para buscar elementos, verificar condiciones y ordenar elementos. El árbol organiza los elementos de manera que los menores están a la izquierda y los mayores a la derecha.

![image](https://github.com/Josezapat/CC3S2/assets/90808325/b61d9602-74c9-48d8-98ca-5e2851fc1287)

- "sort" es un método que has definido en la clase ArbolBinario para ordenar los elementos contenidos en un árbol binario de búsqueda.

***

**Parte 2 Introducción a Rails**

Estas preguntas son de las clases de Rails dadas en el curso.

**2.1 En vez de redirigir a la acción Index tras un create exitoso, redirija a la acción show de la película recién creada. Pista: Puedes usar el método helper para URI movie_path, pero necesitarás darle un argumento para identificar la película. Para obtener este argumento, recuerda que si Movie.create se completa correctamente, devuelve el objeto recién creado, además de crearlo.**

```ruby
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end

  def create
    @movie = Movie.new(movie_params) # Supongamos que usas strong parameters para permitir los atributos necesarios
    if @movie.save
      # Creación exitosa
      redirect_to movie_path(@movie)
    else
      # Handle errores de validación u otros casos
      render 'new'
    end
  end

  # Otros métodos del controlador (update, edit, destroy, etc.) van aquí

  private

  # Define el método para permitir los atributos necesarios usando strong parameters
  def movie_params
    params.require(:movie).permit(:title, :description, :year, :director, :genre)
  end
end

```

**2.2 Se redirigirá al usuario a la vista de la película recién creada en la acción show. Asegúrate de que la vista show (show.html.haml o cualquier otro formato que estés utilizando) esté correctamente configurada para mostrar los detalles de la película.**

Se abrirá el archibo _form.html.erb y lo modificaremos de esta manera:
```html
<%= form_with(model: movie, local: true) do |form| %>
  # Otros campos existentes
  <div class="field">
    <%= form.label :description %>
    <%= form.text_area :description, rows: 4 %>  <!-- Cambiar a text_area para permitir la edición de descripción -->
  </div>
  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>

```
Luego actualizamos el controlador MoviesController

```ruby
private

def movie_params
  params.require(:movie).permit(:title, :description, :year, :director, :genre)
end

```
Con estos cambios el campo description se mostrará y permitirá la edición en las vistas New y Edit de películas.

**2.3Los métodos actuales del controlador no son muy robustos: si el usuario introduce de manera manual un URI para ver (Show) una película que no existe (por ejemplo /movies/99999), verá un mensaje de excepción horrible. Modifique el método show del controlador para que, si se pide una película que no existe, el usuario sea redirigido a la vista Index con un mensaje más amigable explicando que no existe ninguna película con ese ID. (Pista: Usa begin. . . rescue. . . end para recuperar el control en la excepción ActiveRecord::RecordNotFound**


Para que un usuario intente acceder a una película que no existe y proporcionar un mensaje amigable, podemos modificar el método show del controlador MoviesController para que maneje la excepción ActiveRecord::RecordNotFound

```ruby
def show
  begin
    id = params[:id] # Recupera el ID de la película desde la URI
    @movie = Movie.find(id) # Intenta encontrar la película por ID
  rescue ActiveRecord::RecordNotFound
    # Manejo de la excepción si la película no existe
    flash[:alert] = "No se ha encontrado ninguna película con el ID proporcionado."
    redirect_to movies_path
  end
end
```

Con esta modificación, cuando un usuario intente acceder a una película que no existe, será redirigido a la vista Index con un mensaje de alerta claro.
***

**Parte 3 Rail**

Tenemos todo correctamente instalado:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/33857f93-21ed-4d49-b85f-626ba1fe157a)

Ejecutamos el comando:
```bash
rails new rottenpotatoes --skip-test-unit --skip-turbolinks --skip-spring
```
![image](https://github.com/Josezapat/CC3S2/assets/90808325/b19bba0b-136d-4ddf-ae9b-e6952cae37bb)
.Sigue ejecutando...
.Sigue ejecutando...
.Sigue ejecutando...
.Sigue ejecutando...
![image](https://github.com/Josezapat/CC3S2/assets/90808325/21b84901-5a10-4333-8ae2-90a8a347f4c5)

¿Qué pasa con ese mensaje run bundle install?

Dentro del archivo creado rottenpotatoes obtenemos esta compilación:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/36353138-5ff8-4fa3-ab97-24e2c7a310d6)


Gemfile que especifica la gema sqlite3 y cambia para que diga lo siguiente:

gema 'sqlite3', '~> 1.3.0'

Luego ejecuta la actualización del paquete y verifica que tu salida contenga " Fetching sqlite3 1.3.x” and “Installing sqlite3 1.3.x”, donde x es cualquier versión menor.

![image](https://github.com/Josezapat/CC3S2/assets/90808325/f8960bbe-7a8f-449e-b927-39543f95a422)

Luego ejecuto el comando "Rails server" para verificar que mi aplicacion funcione correctamente:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/ee3ab046-473a-4864-a43b-bfe8bb58cfd5)

Efectivamente, vamos a http://127.0.0.1:3000 y nos sale esta pantalla:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/283fefe2-8916-45b4-90f9-f93982c0f533)


1. Crea una migración que describa qué cambios realizar. Al igual que con Rails New, Rails proporciona un generador de migración que te brinda el código repetitivo, además de varios métodos helpers para describir la migración.

2. Aplicar la migración a la base de datos de desarrollo. Rails define una tarea de rake para esto. rake es un ejecutor de tareas popular para Rails y contiene muchas tareas predefinidas, incluida la aplicación de una migración. Si estás interesado en obtener más información, prueba rake --tasks y rake --help.

3. Suponiendo que la migración se realizó correctamente, actualiza el esquema de la base de datos de prueba ejecutando rake db:test:prepare.

![image](https://github.com/Josezapat/CC3S2/assets/90808325/2960e96b-dc1b-4ce1-abec-0e0c059234b6)

De igual manera ahora creamos "20231011154020_create_movies"

![image](https://github.com/Josezapat/CC3S2/assets/90808325/26a22b39-ab4c-4821-94e6-8af67d412a63)

Agregamos todos los cambios:

```ruby
class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table 'movies' do |t|
      t.string 'title'
      t.string 'rating'
      t.text 'description'
      t.datetime 'release_date'

      t.timestamps
    end
  end
end
```
Ahora ejecutamos la migración:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/9767bfff-591a-4514-af06-6bdaaa14dd35)
***
**Crea el modelo inicial e inicializa la base de datos**

- Creamos el archivo movie.rb:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/7b4eb10a-e052-420f-80e8-89c81b1668c2)

- Abrimos el archivo y colocamos este código:
```ruby
class Movie < ActiveRecord::Base
end
```
- En el archivo seeds.rb colocamos este código:
```ruby
# Seed the RottenPotatoes DB with some movies.

more_movies = [
  { title: 'Ganibal', rating: 'G', release_date: '25-Nov-1992' },
  { title: 'Fuerza bruta', rating: 'R', release_date: '21-Jul-1989' },
  { title: 'The Ring', rating: 'PG-13', release_date: '10-Aug-2011' },
  { title: 'Alien: The Return', rating: 'PG', release_date: '12-Jun-1981' }
]

more_movies.each do |movie|
  Movie.create!(movie)
end
```

- Ejecutamos "rails db:seed"
- Verificamos las peliculas que se han agregado con "rails console"
![image](https://github.com/Josezapat/CC3S2/assets/90808325/d631bbcb-7c9f-48ed-88bf-52a63af33276)

Luego jugamos con la consola ingresando otros comandos:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/d1078b80-6cb0-4dd5-b34e-68c24af9e427)
![image](https://github.com/Josezapat/CC3S2/assets/90808325/8e6debdd-1702-4b33-a274-a34af76aa585)

***

**Parte 3: Crear rutas, acciones y vistas CRUD para películas**
Intenta ejecutar la aplicación nuevamente (instrucciones en la parte 1) y esta vez, en lugar de visitar la página de inicio, intenta visitar /movies. (Es decir: /movies debe ser la ruta del URI, la parte que sigue inmediatamente al nombre de host y/o número de puerto en el URI).

- Ejectuamos "rails server"
![image](https://github.com/Josezapat/CC3S2/assets/90808325/ffa7b073-1d18-4af8-806b-00aee0fd2da1)

- Luego buscamos la URL http://127.0.0.1:3000/movies y nos aparece la lista de peliculas:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/fe7ce4aa-3526-4501-a0d5-622f24c952e2)

***
**Crear rutas CRUD**

- Editamos nuestro archivo routes.rb:
```ruby
Rails.application.routes.draw do
  resources :movies

  root to: redirect('/movies')
end
```

- Con la implementación dada podemos agregar una nueva pelicula:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/ffcc2a91-8430-483c-8822-24bd9122e8fb)

***
**Cambiar la base de datos para producción.**
- Implementamos nuestra aplcación a Heroku de la siguiente manera:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/5176af4c-d231-4cd3-8058-3ca9771e4a62)
....
....
....
![image](https://github.com/Josezapat/CC3S2/assets/90808325/5fd6b123-36dc-41f4-a6d8-d9bfba2b15fe)

- heroku nos da la URL "https://git.heroku.com/rottenpotatoesjosezapata.git" que es donde funcionará nuestra aplicación de esta manera:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/2db2009b-7747-4dfb-9166-6aaba2e9f8d5)
- Obtenemos todas las peliculas puestas en seeds.rb
