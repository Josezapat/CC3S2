Examen Final
José Daniel Zapata Ancco / 20202230A
Parte 1
Estas preguntas corresponden a las actividades desarrolladas en clase.

1.	Produce un conflicto de fusión (merge) en algún repositorio de tus actividades realizadas. Establece los pasos y comandos que usas para resolver un conflicto de fusión en Git. Si intentas git push y falla con un mensaje como : Non-fast-forward (error): failed to push some refs esto significa que algún archivo contiene un conflicto de fusión entre la versión de tu repositorio y la versión del repositorio origen. Para este ejercicio debes presentar el conflicto dado, los pasos y comandos para resolver el problema y las solución.

- Si es verdad, algunas veces cuando estoy subiendo un git push origin main desde mi computadora local hacia mi repositorio de github se me ha abierto automáticamente un Archivo llamado MERGE en Visual Studio Code, el cual sirve para escribir en texto los cambios que se van hacer al subir el repositorio actualizaco, yo lo que hago es simplemente cerrar ese archivo MERGE y el git bash seguirá funcionando normalmente.

Los Archivos los estoy utilizando desde la carpeta Ajax de mi rapositorio: https://github.com/Josezapat/CC3S2/tree/main/Ajax

2. ¿Qué pasa si tenemos @user sin nombre de usuario y llamamos a @user.valid? ¿Qué guardará @user.save?
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

![image](https://github.com/Josezapat/CC3S2/assets/90808325/a6b492b5-cf23-44b5-97cd-7fcca455f79e)




3.
Creamos User .rb:
![image](https://github.com/Josezapat/CC3S2/assets/90808325/6479e883-f0e8-4bc0-b4f8-c354c9cc2ff9)

el método username_format realiza la validación personalizada utilizando una expresión regular:
\A[a-zA-Z]: Asegura que el nombre de usuario comience con una letra.
[a-zA-Z0-9_]{0,9}: Permite letras, números y guiones bajos después del primer carácter, lo limitamos con longitud a un máximo de 10 caracteres.

![image](https://github.com/Josezapat/CC3S2/assets/90808325/ea6b6da3-20c9-442e-bfd5-09cb977f7a13)

Nos sale un error de un mensaje que indica que el nombre de usuario debe comenzar con una letra y tener como máximo 10 caracteres.
