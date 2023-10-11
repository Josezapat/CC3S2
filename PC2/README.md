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


