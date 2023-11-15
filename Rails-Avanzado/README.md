**Ruby en Rails avanzado**
***
Clonamos el Repositorio https://github.com/kapumota/Desarrollo-software-2023/tree/main/Semana7/myrottenpotatoes.
Creamos el archivo _movie.html.erb

![image](https://github.com/Josezapat/CC3S2/assets/90808325/8c0d8af9-915e-489f-b1b8-8b2b31136e0d)

Modificamos el Archivo movie.rb

![image](https://github.com/Josezapat/CC3S2/assets/90808325/525e2ddc-a385-48d0-b0b1-0e8699c908d7)


Comprobamos los resultados:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/eadb2ff0-e684-4c4b-9d54-85dbe401ed73)
***
Explica el código siguiente :

class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end 
  def create
    if (@movie = Movie.create(movie_params))
      redirect_to movies_path, :notice => "#{@movie.title} created."
    else
      flash[:alert] = "Movie #{@movie.title} could not be created: " +
        @movie.errors.full_messages.join(",")
      render 'new'
    end
  end
  def edit
    @movie = Movie.find params[:id]
  end
  def update
    @movie = Movie.find params[:id]
    if (@movie.update_attributes(movie_params))
      redirect_to movie_path(@movie), :notice => "#{@movie.title} updated."
    else
      flash[:alert] = "#{@movie.title} could not be updated: " +
        @movie.errors.full_messages.join(",")
      render 'edit'
    end
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, :notice => "#{@movie.title} deleted."
  end
  private
  def movie_params
    params.require(:movie)
    params[:movie].permit(:title,:rating,:release_date)
  end
end

***
En el controlador de películas (MoviesController), se definen acciones para realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) en las películas. Se utiliza el método movie_params para filtrar y permitir los parámetros específicos antes de pasarlos a los métodos de creación y actualización.

***
```ruby
# app/models/movie.rb

class Movie < ActiveRecord::Base
    before_save :capitalize_title

    def capitalize_title
        self.title = self.title.split(/\s+/).map(&:downcase).
        map(&:capitalize).join(' ')
    end
end
```
Comprobamos la Consola:

```ruby
# Ejemplo en la consola
m = Movie.create!(:title => 'STAR  wars', :release_date => '27-5-1977', :rating => 'PG')
m.title  # => "Star Wars"
```
En este ejemplo, se crea una nueva película con un título en mayúsculas, y la salida muestra que el título se ha "canonicalizado" correctamente, convirtiendo "STAR wars" a "Star Wars".

***
SSO y autenticación a través de terceros
***
a) Escribe este comando en una terminal para crear un modelo moviegoers y una migración, y ejecuta rake db:migrate para aplicar la migración.

rails generate model Moviegoer name:string provider:string uid:string
Obtenemos en la terminal:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/439908f3-e27d-4ef4-b0b1-a7b357cd7c54)

b) Luego edita el archivo app/models/moviegoer.rb generado para que coincida con este código.
```ruby
# Edit app/models/moviegoer.rb to look like this:
class Moviegoer < ActiveRecord::Base
    def self.create_with_omniauth(auth)
        Moviegoer.create!(
        :provider => auth["provider"],
        :uid => auth["uid"],
        :name => auth["info"]["name"])
    end
end
```
![image](https://github.com/Josezapat/CC3S2/assets/90808325/9ba4abc5-cad0-4467-8121-6b042940af77)

***
Explica la siguientes líneas de SQL:

```sql
SELECT reviews.*
    FROM movies JOIN reviews ON movies.id=reviews.movie_id
    WHERE movies.id = 41;
```

Esta consulta SQL selecciona todas las columnas de la tabla reviews para las revisiones asociadas a la película con id igual a 41 en la tabla movies. Utiliza la cláusula JOIN para combinar las filas de las tablas movies y reviews donde el id de la película en la tabla movies coincide con el movie_id en la tabla reviews. La condición adicional WHERE movies.id = 41 filtra las filas para la película específica con id 41.

a) Editamos el Archivo db/migrate/*_create_reviews.rb

![image](https://github.com/Josezapat/CC3S2/assets/90808325/a0bc07eb-0722-4d2d-9f3f-ece68191e2d0)


b) Colocamos el Modelo de Review en app/models/review.rb:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/531f5fb9-2bc8-4da3-9415-1ac9a6deb1b1)

c) Agregamos esto a los Modelos Movie y Moviegoer:

```ruby
# app/models/movie.rb

class Movie < ActiveRecord::Base
  has_many :reviews
  # ... (otro código en tu modelo)
end
```
```ruby
# app/models/moviegoer.rb

class Moviegoer < ActiveRecord::Base
  has_many :reviews
  # ... (otro código en tu modelo)
end
```

