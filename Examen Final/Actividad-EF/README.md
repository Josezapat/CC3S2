Examen Final
José Daniel Zapata Ancco / 20202230A
Parte 1
Estas preguntas corresponden a las actividades desarrolladas en clase.

1.	Produce un conflicto de fusión (merge) en algún repositorio de tus actividades realizadas. Establece los pasos y comandos que usas para resolver un conflicto de fusión en Git. Si intentas git push y falla con un mensaje como : Non-fast-forward (error): failed to push some refs esto significa que algún archivo contiene un conflicto de fusión entre la versión de tu repositorio y la versión del repositorio origen. Para este ejercicio debes presentar el conflicto dado, los pasos y comandos para resolver el problema y las solución.

- Si es verdad, algunas veces cuando estoy subiendo un git push origin main desde mi computadora local hacia mi repositorio de github se me ha abierto automáticamente un Archivo llamado MERGE en Visual Studio Code, el cual sirve para escribir en texto los cambios que se van hacer al subir el repositorio actualizaco, yo lo que hago es simplemente cerrar ese archivo MERGE y el git bash seguirá funcionando normalmente.

2.

. ¿Qué pasa si tenemos @user sin nombre de usuario y llamamos a @user.valid? ¿Qué guardará @user.save?
Si tenemosun objeto @user sin un nombre de usuario y llamas a @user.valid?, se ejecutarán las validaciones definidas en el modelo User. En este caso, la validación validates :username, :presence => true garantiza que el campo username no esté en blanco. Por lo tanto, @user.valid? devolverá false porque la validación de presencia no se cumple.

Si intentas guardar el objeto @user con @user.save, el método save devolverá false porque la validación falló. Además, los errores de validación estarán disponibles en @user.errors, y puedes acceder a ellos para ver qué causó que la validación fallara.

Creamos un nuevo objeto @user con los parámetros proporcionados.
Intentamos guardar el objeto @user usando @user.save.
Si la validación es exitosa, redirigimos al usuario a la página del usuario recién creado.
Si hay errores de validación, mostramos los mensajes de error en la consola y volvemos a renderizar la acción new para permitir al usuario corregir los errores.

3.
class User < ActiveRecord::Base
  validates :username, presence: true
  validate :username_format

  private

  def username_format
    return if username.blank? # No valida si el nombre de usuario está en blanco

    unless /\A[a-zA-Z][a-zA-Z0-9_]{0,9}\z/.match?(username)
      errors.add(:username, "debe comenzar con una letra y tener como máximo 10 caracteres")
    end
  end
end
