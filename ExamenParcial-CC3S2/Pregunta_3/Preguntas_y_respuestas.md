Clona el repositorio git clone https://github.com/saasbook/hw-rails-wordguesser.git

Inicia el servidor.

***
Preguntas (1 punto):

**· ¿Cuál es el objetivo de ejecutar bundle install?**

El objetivo de ejecutar bundle install es instalar las gemas (son bibliotecas o módulos de Ruby) especificadas en el archivo Gemfile de nuestro proyecto

**· ¿Por qué es una buena práctica especificar –without production al ejecutarlo en su computadora de desarrollo?**

Es bueno hacerlo, porque al especificar --without production al ejecutar bundle install en nuestra computadora es para evitar la instalación de gemas que son específicas para entornos de producción ya que no se necesita gemas relacionadas con servidores de producción.

**· (Para la mayoría de las aplicaciones Rails, también tendrías que crear y inicializar la base de datos de desarrollo, pero al igual que la aplicación Sinatra, esta aplicación no utiliza ninguna base de datos).**

Juega para convencerte de que funciona igual que la versión de Sinatra.
***
Preguntas (3 puntos):

· ¿En qué parte de la estructura del directorio de la aplicación Rails está el código correspondiente al modelo WordGuesserGame?

El código correspondiente al modelo WordGuesserGame esta en un archivo llamado word_guesser_game.rb dentro del directorio app/models

· ¿En qué archivo está el código que más se corresponde con la lógica del archivo app.rb de las aplicaciones Sinatra que maneja las acciones entrantes del usuario?

El código que maneja las acciones entrantes del usuario se encuentra en los controladores. 

· ¿Qué clase contiene ese código?

  Es la clase llamada GamesController
 
· ¿De qué otra clase (que es parte del framework Rails) hereda esa clase?

Los controladores a menudo heredan de la clase ApplicationController. Por lo tanto, es probable que la clase GamesController herede de ApplicationController

· ¿En qué directorio está el código correspondiente a las vistas de la aplicación Sinatra (new.erb, show.erb, etc.)?

Las vistas generalmente se encuentran en el directorio app/views

· Los sufijos de nombre de archivo para estas vistas son diferentes en Rails que en la aplicación Sinatra. ¿Qué información proporciona el sufijo situado más a la derecha del nombre del archivo (por ejemplo: en foobar.abc.xyz, el sufijo .xyz) sobre el contenido del archivo?

los sufijos son .html.erb indica que es una vista HTML con soporte para Ruby (ERB).

· ¿Qué información te brinda el otro sufijo sobre lo que se le pide a Rails que haga con el archivo?

El sufijo antes de .html.erb puede indicar el propósito de la vista

· ¿En qué archivo está la información de la aplicación Rails que asigna rutas (por ejemplo, GET/new) a las acciones del controlador?

config/routes.rb en este archivo se definen las rutas y se asocian con las acciones del controlador.

· ¿Cuál es el papel de la opción :as => 'name' en las declaraciones de ruta de config/routes.rb? .

Nos permite asignar un nombre personalizado a una ruta.
