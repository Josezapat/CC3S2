**Práctica Calificada 4**
*Profesor Lara quería informarle de que se me borró el Readme.md de este repositorio, además se me borraron otros archivos también lo que pasa es que configuré 
mal un comando desde el terminal al subir la tarea de Pruebas-JS-Ajax y se sobreescribieron todos y estaba tratando de resetear el commit con git reset hard pero no me funcionaba
es por eso que tuve que subir de nuevo localmente mis archivos es por eso que puede ver los commits de hoy y también el readme el commit que recien lo estoy subiendo pero
el examen yo lo acabé en su momento e hice todo lo que pude, sólo le estoy contando la verdad de lo que me pasó espero pueda comprenderme incluso no esta al 100% el examen ya que me
faltó tiempo, sólo estoy volviendo a subir los archivos y a crear este nuevo Readme que lo encontré en mi codespaces. Desde ya le pido disculpas por lo ocurrido**

José Daniel Zapata Ancco / 20202230A

***
1. El comando grep toma tres argumentos: 

•	 La cadena a buscar. 

•	Cero o más indicadores para personalizar el comportamiento del comando. 

•	Uno o más archivos para buscar. 

Luego lee el contenido de los archivos especificados (en el orden especificado), busca las líneas 	que contienen la cadena de búsqueda y finalmente devuelve esas líneas en el orden en que 	fueron encontradas. Al buscar en varios archivos, cada línea coincidente va precedida por el 	nombre del archivo y dos puntos (':'). 
El comando grep admite los siguientes indicadores: 

•	- n  Antepone el número de línea y dos puntos (':') a cada línea en la salida, colocando el número después del nombre del archivo (si está presente). 

•	-l Muestra solo los nombres de los archivos que contienen al menos una línea coincidente. 

•	-i Coincidencia utilizando una comparación que no distingue entre mayúsculas y minúsculas.

•	-v Invierte el programa: recopila todas las líneas que no coinciden. 

•	-x Busca solo líneas donde la cadena de búsqueda coincida con la línea completa.

Procedemos a crear el archivo grep.js paso a paso:

```java
const fs = require('fs');
```

Recuperamos los argumentos de la línea de comandos
```java
const args = process.argv.slice(2);
```

Se maneja los casos en los que no se proporciona la cadena de búsqueda
```java
if (args.length < 2) {
  console.log('Uso: ./grep.js cadena_busqueda [indicadores] archivo1 [archivo2 ...]');
  process.exit(1);
}
```

Obtenemos la cadena de búsqueda y lo removemos de los argumentos
```java
const searchString = args.shift();
```

Configuramos las opciones predeterminadas
```java
let options = {
  showLineNumbers: false,
  showFileNamesOnly: false,
  caseInsensitive: false,
  invertMatch: false,
  matchWholeLine: false
};
```

Procesamos los indicadores
```java
while (args.length > 0 && args[0].startsWith('-')) {
  const flag = args.shift();

  switch (flag) {
    case '-n':
      options.showLineNumbers = true;
      break;
    case '-l':
      options.showFileNamesOnly = true;
      break;
    case '-i':
      options.caseInsensitive = true;
      break;
    case '-v':
      options.invertMatch = true;
      break;
    case '-x':
      options.matchWholeLine = true;
      break;
    default:
      console.log(`Indicador no reconocido: ${flag}`);
      process.exit(1);
  }
}
```

Creamos la Función principal que realiza la búsqueda
```java
function grep(file) {
  const content = fs.readFileSync(file, 'utf8').split('\n');

  content.forEach((line, lineNumber) => {
    const lineToMatch = options.caseInsensitive ? line.toLowerCase() : line;
    const searchStringToMatch = options.caseInsensitive ? searchString.toLowerCase() : searchString;

    const matchCondition = options.matchWholeLine ? lineToMatch === searchStringToMatch : lineToMatch.includes(searchStringToMatch);

    if ((options.invertMatch && !matchCondition) || (!options.invertMatch && matchCondition)) {
      if (options.showFileNamesOnly) {
        console.log(file);
        return;
      }

      const outputLine = options.showLineNumbers ? `${file}:${lineNumber + 1}:${line}` : `${file}:${line}`;
      console.log(outputLine);
    }
  });
}
```

Y por último procesamos cada archivo proporcionado
```java
args.forEach(grep);
```

Ahora lo ejecutamos con el comando:
```bash
node grep.js args
```
![image](https://github.com/Josezapat/CC3S2/assets/90808325/6792cc7e-4c1c-4ba4-b795-e40a3301068e)

***

2.	Practiquemos la herencia y la programación orientada a objetos en Javascript. Diseña 2 clases, una llamada "Pokemon" y otra llamada "Charizard". Las clases deben hacer lo siguiente:

Creamos dos clases, "Pokemon" y "Charizard". La clase "Charizard" hereda de "Pokemon":

Primero creamos la Clase Pokemon y podemos declarar si existe el tipo o movimiento completando las comillas en `this.tipo = ""` y `this.movimiento = ""`
```java
class Pokemon {
    constructor(HP, ataque, defensa) {
      this.HP = HP;
      this.ataque = ataque;
      this.defensa = defensa;
      this.movimiento = "";
      this.nivel = 1;
      this.tipo = "";
  
      if (!this.movimiento) {
        throw new Error("No se ha especificado ningún movimiento.");
      }
    }
  
    flight() {
      if (!this.movimiento) {
        throw new Error("No se ha especificado ningún movimiento.");
      }
      console.log("¡Usando el movimiento de vuelo!");
    }
  
    canFly() {
      if (!this.tipo) {
        throw new Error("No se ha especificado ningún tipo.");
      }
      return this.tipo.includes("flying");
    }
  }
  ```

Creamos la clase Charizard que hereda de la clase Pokemon
```java
  class Charizard extends Pokemon {
    constructor(HP, ataque, defensa, movimiento) {
      super(HP, ataque, defensa);
      this.movimiento = movimiento;
      this.tipo = "flying";
    }
  
    fight() {
      if (this.movimiento) {
        console.log(`¡Usando el movimiento ${this.movimiento}!`);
        return this.ataque;
      } else {
        throw new Error("No se ha especificado ningún movimiento para la lucha.");
      }
    }
  }
```
  
Un ejemplo para la compilación
```java
  try {
    const charizard = new Charizard(100, 50, 30, "lanzar llamas");
    charizard.flight();
    console.log(`¿Puede volar? ${charizard.canFly()}`);
    console.log(`Poder de ataque: ${charizard.fight()}`);
  } catch (error) {
    console.error(error.message);
  }
  ```
Primero rellenamos `this.tipo = ""` y `this.movimiento = ""`

![image](https://github.com/Josezapat/CC3S2/assets/90808325/4f7ca4f1-6c00-470f-99d0-975de519da36)
  
Ahora lo ejecutamos y obtenemos:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/3b4240d9-54cc-42ff-b992-a1588ae38a54)

Ahora lo dejamos vacío `this.tipo = ""` y `this.movimiento = ""`

![image](https://github.com/Josezapat/CC3S2/assets/90808325/6abbf249-d293-4406-81cd-e198c83ecf65)

Ahora lo ejecutamos y obtenemos:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/7111d2de-0004-4acc-93cb-fd532c9b915b)

***

3.	El principio de inversión de dependencia establece que los módulos de alto nivel no deberían depender de los módulos de bajo nivel, y tanto los módulos de alto nivel como los de bajo nivel deberían depender de abstracciones. También establece que las abstracciones no deberían depender de implementaciones concretas, sino que las implementaciones concretas deberían depender de abstracciones.

```ruby
class CurrentDay
def initialize
    @date = Date.today
    @schedule = MonthlySchedule.new(@date.year,
@date.month)
  end
                def work_hours
      @schedule.work_hours_for(@date)
                 end
                def workday?
       !@schedule.holidays.include?(@date)
                  end
               end
```

¿Cuál es el problema con este enfoque dado, cuando quieres probar el metodo workday?. 	

El problema con el enfoque actual es que la clase CurrentDay tiene una dependencia directa de la clase MonthlySchedule, Este principio establece que los módulos de alto nivel no deben depender directamente de los módulos de bajo nivel, sino que ambos deben depender de abstracciones. Además, las abstracciones no deben depender de implementaciones concretas.

Una solución sería la aplicación de la inversión de dependencia.
Refactorizamos la clase CurrentDay para recibir la instancia de MonthlySchedule como una dependencia en el constructor. 

Utiliza la inyección de dependencia aplicado al siguiente código.

```ruby
before do
    Date.singleton_class.class_eval do
                       alias_method :_today, :today
                      define_method(:today){Date.new(2020, 12, 16)}
                   end
              end
             after do
               Date.singleton_class.class_eval do
                     alias_method :today, :_today
                      remove_method :_today
  end	
end
```

Este sería el código con la implementación de DIP:

```ruby
class CurrentDay
  def initialize(schedule)
    @date = Date.today
    @schedule = schedule
  end

  def work_hours
    @schedule.work_hours_for(@date)
  end

  def workday?
    !@schedule.holidays.include?(@date)
  end
end
```

 ¿Qué sucede en JavaScript con el DIP en este ejemplo? (1 punto).

Al aplicar el DIP implica estructurar el código de manera que los módulos de alto nivel no dependan directamente de los de bajo nivel, y ambas dependan de abstracciones. 
***

Los ejercicios a partir de aquí se recomiendan hacerlos en orden.

Pregunta: (Para responder esta pregunta utiliza el repositorio y las actividades que has desarrollado de Introducción a Rails)

1.	Modifique la lista de películas de la siguiente manera. Cada modificación va a necesitar que realice un cambio en una capa de abstracción diferente
   
a.	Modifica la vista Index para incluir el número de fila de cada fila en la tabla de películas.

Modificamos nuestro archivo Index.html.erb extraido desde mi repositorio de la Práctica Calificada N°2: https://github.com/Josezapat/CC3S2/tree/main/PC2

```ruby
<!-- app/views/movies/index.html.erb -->

<style>
  table {
    border-collapse: collapse;
    width: 100%;
  }

  th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
  }

  th {
    background-color: #ffebcd; /* Fondo crema */
  }

  .show-button {
    text-align: center;
  }

  /* Estilo para el cambio temporal de color de fondo al pasar el ratón sobre una fila */
  tr:hover {
    background-color: yellow; /* Cambia a amarillo al pasar el ratón sobre una fila */
  }
</style>

<h1>List of Movies</h1>

<table>
  <tr>
    <th>#</th>
    <th>Title</th>
    <th>Rating</th>
    <th>Description</th>
    <th>Release Date</th>
    <th>Show</th>
  </tr>
  <% @movies.each.with_index(1) do |movie, index| %>
    <tr>
      <td><%= index %></td>
      <td><%= movie.title %></td>
      <td><%= movie.rating %></td>
      <td><%= movie.description %></td>
      <td><%= movie.release_date %></td>
      <td class="show-button"><%= link_to "Show This Movie", movie %></td>
    </tr>
  <% end %>
</table>

<%= link_to "New Movie", new_movie_path %>

```

b.	Modifica la vista Index para que cuando se sitúe el ratón sobre una fila de la tabla, dicha fila cambie temporalmente su color de fondo a amarillo u otro color.

```ruby
```
c.	Modifica la acción Index del controlador para que devuelva las películas ordenadas alfabéticamente por título, en vez de por fecha de lanzamiento. No intentes ordenar el resultado de la llamada que hace el controlador a la base de datos. Los gestores de bases de datos ofrecen formas para especificar el orden en que se quiere una lista de resultados y, gracias al fuerte acoplamiento entre ActiveRecord y el sistema gestor de bases de datos (RDBMS) que hay debajo, los métodos find y all de la biblioteca de ActiveRecord en Rails ofrece una manera de pedirle al RDBMS que haga esto.

Se utiliza el método order de ActiveRecord para ordenar las películas por el título al recuperarlas de la base de datos.
```ruby
# app/controllers/movies_controller.rb

class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:title)
  end

  # Resto del código...
end

```
d.	Simula que no dispones de ese fuerte acoplamiento de ActiveRecord, y que no puedes asumir que el sistema de almacenamiento que hay por debajo pueda devolver la colección de ítems en un orden determinado. Modifique la acción Index del controlador para que devuelva las películas ordenadas alfabéticamente por título. Utiliza el método sort del módulo Enumerable de Ruby.

Se modifica la acción index del controlador para ordenar las películas alfabéticamente por título utilizando el método sort del módulo Enumerable de Ruby:
```ruby
# app/controllers/movies_controller.rb

class MoviesController < ApplicationController
  def index
    @movies = Movie.all.sort_by(&:title)
  end

  # Resto del código...
end

```
***

Para que esta página puntué por lo menos debes hacer 3 ítems.

Pregunta: (para responder esta pregunta utiliza el repositorio y las actividades que has realizado de Rails avanzado, en particular asociaciones) - 2 puntos

1.	Extienda el código del controlador del código siguiente dado con los métodos edit y update para las críticas. Usa un filtro de controlador para asegurarte de que un usuario sólo puede editar o actualizar sus propias críticas. Revisa el código dado en la evaluación y actualiza tus repositorios de actividades (no se admite nada nuevo aquí). Debes mostrar los resultados. 

Preguntas: (estas preguntas son utilizando el repositorio de todas tus actividades relacionada a JavaScript, por lo tanto, no hay respuestas únicas) - 6 puntos

1.	Un inconveniente de la herencia de prototipos es que todos los atributos (propiedades) de los objetos son públicos. Sin embargo, podemos aprovechar las clausuras para obtener atributos privados. Crea un sencillo constructor para los objetos User que acepte un nombre de usuario y una contraseña, y proporcione un método checkPassword que indique si la contraseña proporcionada es correcta, pero que deniegue la inspección de la contraseña en sí. Esta expresión de “sólo métodos de acceso” se usa ampliamente en jQuery. Sugerencia:  El constructor debe devolver un objeto en el que una de sus propiedades es una función que aprovecha las clausuras de JavaScript para ‘recordar’ la contraseña proporcionada inicialmente al constructor. El objeto devuelto no debería tener ninguna propiedad que contenga la contraseña).
  
2.	Extienda la función de validación en ActiveModel  para generar automáticamente código JavaScript que valide las entradas del formulario antes de que sea enviado. Por ejemplo, puesto que el modelo Movie de RottenPotatoes requiere que el título de cada película sea distinto de la cadena vacía, el código JavaScript deberías evitar que el formulario “Add New Movie” se enviara si no se cumplen los criterios de validación, mostrar un mensaje de ayuda al usuario, y resaltar el(los) campo(s) del formulario que ocasionaron los problemas de validación. Gestiona, al menos, las validaciones integradas, como que los títulos sean distintos de cadena vacía, que las longitudes máximas y mínima de la cadena de caracteres sean correctas, que los valores numéricos estén dentro de los límites de los rangos, y para puntos adicionales, realiza las validaciones basándose en expresiones regulares.
   
3.	En el código utilizado en la sección de eventos y funciones callback, supongamos que no puedes modificar el código del servidor para añadir la clase CSS adult a las filas de la tabla movies. ¿Cómo identificaría las filas que están ocultas utilizando sólo código JavaScript del lado cliente?
   
4.	Siguiendo la estrategia del ejemplo de jQuery de la misma sección anterior de eventos y funciones callback, utiliza JavaScript para implementar un conjunto de casillas de verificación (checkboxes) para la página que muestra la lista de películas, una por cada calificación (G, PG, etcétera), que permitan que las películas correspondientes permanezcan en la lista cuando están marcadas. Cuando se carga la página por primera vez, deben estar marcadas todas; desmarcar alguna de ellas debe esconder las películas con la clasificación a la que haga referencia la casilla desactivada.
   
5.	Escribe el código AJAX necesario para crear menús en cascada basados en una asociación has_many. Esto es, dados los modelos de Rails A y B, donde A has_many (tiene muchos) B, el primer menú de la pareja tiene que listar las opciones de A, y cuando se selecciona una, devolver las opciones de B correspondientes y rellenar el menú B.
    
6.	Extienda la funcionalidad del ejemplo dado en la actividad de AJAX: JavaScript asíncrono y XML de forma que, si el usuario expande u oculta repetidamente la misma fila de la tabla de películas, sólo se haga una única petición al servidor para la película en cuestión la primera vez. En otras palabras, implementa una memoria caché con JavaScript en el lado cliente para la información de la película devuelta en cada llamada AJAX.








