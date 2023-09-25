Tarea Introducción a HTTP y URI 

Zapata Ancco José Daniel / 20202230A (Las capturas de pantallas del terminal y la página web están anexadas en la carpeta "Capturas")

***Pregunta:¿Cuáles son las dos diferencias principales que has visto anteriormente y lo que ves en un navegador web 'normal'? 
¿Qué explica estas diferencias?***

Diferencias principales entre curl y un navegador web normal: 

Una de las diferencias más notables es que la salida de curl generalmente carece de formato y estilos en comparación con lo 
que se muestra en un navegador web normal. En un navegador, el contenido web se presenta de manera atractiva y dinámica con 
estilos, colores y diseño. En cambio, curl muestra el contenido en su formato bruto, que suele ser texto sin formato sin ningún sentido. 

Otra diferencia clave es la falta de interactividad en la salida de curl. En un navegador web normal se puede interactuar
con la página haciendo clic en enlaces, etc. Mientras en curl simplemente recupera el contenido de la página web y lo
muestra tal cual en la terminal. No se puede interactuar directamente con la página utilizando curl. 

![image](https://github.com/Josezapat/CC3S2/assets/90808325/0dedeccc-e898-4127-a251-e1f56d0fe764)

 

 

***Pregunta: Suponiendo que estás ejecutando curl desde otro shell ¿qué URL tendrás que pasarle a curl para intentar acceder a
tu servidor falso y por qué?***

La URL que tendré que pasarle a curl para acceder a mi servidor falso sería: 

http://localhost:8081 

Esta URL asegura que la solicitud HTTP se dirija al servidor falso que está listo para responder en el puerto 8081 de mi 
propia computadora. 

 

***Pregunta: La primera línea de la solicitud identifica qué URL desea recuperar el cliente. ¿Por qué no ves http://localhost:8081 
en ninguna parte de esa línea?***

La solicitud HTTP enviada por curl a mi servidor falso contiene solo la parte de la URI, pero no incluye la información
completa de la URL, como "http://localhost:8081". Esto se debe a cómo se estructuran las solicitudes HTTP. 

 ![image](https://github.com/Josezapat/CC3S2/assets/90808325/56b92581-ef34-4c7a-9317-9bd32776394e)


 

***Pregunta: Según los encabezados del servidor, ¿cuál es el código de respuesta HTTP del servidor que indica el estado de
la solicitud del cliente y qué versión del protocolo HTTP utilizó el servidor para responder al cliente?***

Según los encabezados de respuesta del servidor: El código de respuesta HTTP es HTTP/1.1 200 OK. Esto indica que el 
servidor respondió con éxito a la solicitud del cliente (código 200) y que se utilizó la versión 1.1 del protocolo HTTP. 

 

***Pregunta: Cualquier solicitud web determinada puede devolver una página HTML, una imagen u otros tipos de entidades. 
¿Hay algo en los encabezados que crea que le dice al cliente cómo interpretar el resultado?***

Sí, el encabezado "Content-Type" proporciona información sobre cómo el cliente debe interpretar el contenido de la 
respuesta. En este caso, el encabezado "Content-Type" es: 

Content-Type: text/html;charset=utf-8 

Esto indica que el contenido de la respuesta es una página HTML 

 

¿Qué sucede cuando falla un HTTP request? 

***Pregunta: ¿Cuál sería el código de respuesta del servidor si intentaras buscar una URL inexistente en el sitio generador 
de palabras aleatorias? Pruéba esto utilizando el procedimiento anterior.***

Obtenemos un código de respuesta HTTP "404 Not Found". Este código indica que el recurso solicitado no se pudo encontrar
en el servidor. 

 

***¿Qué otros códigos de error HTTP existen? Utiliza Wikipedia u otro recurso para conocer los significados de algunos de
los más comunes: 200, 301, 302, 400, 404, 500. Ten en cuenta que estas son familias de estados: todos los estados 2xx
significan funcionó, todos los 3xx son redireccionar etc.***

Tanto el encabezado 4xx como el 5xx indican condiciones de error. ¿Cuál es la principal diferencia entre 4xx y 5xx?. 

Estos códigos de respuesta son parte del protocolo HTTP y se utilizan para comunicar el estado de las solicitudes y 
respuestas entre clientes y servidores web. 

Familia de estados 2xx - Éxito: 

200 OK: La solicitud fue exitosa y el servidor ha devuelto el contenido solicitado. 

201 Created: Indica que la solicitud resultó en la creación exitosa de un nuevo recurso. 

204 No Content: Indica que la solicitud se completó correctamente, pero no hay contenido para devolver. 

Familia de estados 3xx - Redirección: 

301 Moved Permanently: Indica una redirección permanente. El recurso se ha movido a una nueva ubicación. 

302 Found (o 303 See Other): Indica una redirección temporal. El recurso se encuentra temporalmente en otra ubicación. 

304 Not Modified: Indica que la versión en caché del recurso del cliente aún es válida y no se ha modificado en el servidor. 

Familia de estados 4xx - Errores del Cliente: 

400 Bad Request: Indica que la solicitud del cliente es incorrecta o mal formada. 

401 Unauthorized: Indica que la autenticación es necesaria y no se proporcionaron credenciales válidas. 

403 Forbidden: Indica que el servidor comprende la solicitud, pero se niega a cumplirla por razones legales o de autenticación. 

404 Not Found: Indica que el recurso solicitado no se encuentra en el servidor. 

Familia de estados 5xx - Errores del Servidor: 

500 Internal Server Error: Indica un error interno en el servidor. Algo salió mal en el lado del servidor. 

502 Bad Gateway: Indica que el servidor, actuando como puerta de enlace o proxy, recibió una respuesta no válida del servidor ascendente. 

503 Service Unavailable: Indica que el servidor no está disponible temporalmente, generalmente debido a una sobrecarga o mantenimiento. 

Principal diferencia entre 4xx y 5xx: La principal diferencia entre las familias de estados 4xx y 5xx es la causa del error: 

4xx (Errores del Cliente): Estos códigos indican que el error fue causado por el cliente, como una solicitud incorrecta o falta
de autorización. El cliente debe modificar su solicitud o proporcionar credenciales válidas para resolver el error. 

5xx (Errores del Servidor): Estos códigos indican que el error se produjo en el lado del servidor, y el cliente no puede 
solucionarlo. Puede ser el resultado de un problema interno en el servidor, como una falla del servidor o una sobrecarga. 
El cliente no puede hacer nada más que esperar a que el servidor se recupere. 

 

***¿Qué es un cuerpo de Request?***

file:///C:/Users/Usuario/OneDrive/Escritorio/8AVO%20CICLO%20UNI/pagina.html 
![image](https://github.com/Josezapat/CC3S2/assets/90808325/d07a4f0b-03dc-494a-bd87-0e539691116a)

 

Luego de darle a Log In! Recibo una solicitud en mi terminal: 
 ![image](https://github.com/Josezapat/CC3S2/assets/90808325/b358c43b-94d0-40a3-bb8f-3c8c2dcc0ac5)


***Pregunta:¿Cómo se presenta al servidor la información que ingresó en el formulario? ¿Qué tareas necesitaría realizar un
framework SaaS como Sinatra o Rails para presentar esta información en un formato conveniente a una aplicación SaaS escrita,
por ejemplo, en Ruby?*** 

La información ingresada en un formulario HTML se presenta al servidor a través de una solicitud HTTP POST. Cuando se 
completa y se envía un formulario en una página web, el navegador crea una solicitud HTTP POST y envía los datos del
formulario al servidor web especificado en la acción del formulario. 

Los frameworks web como Sinatra o Ruby on Rails proporcionan funcionalidad para procesar y analizar automáticamente los
datos del formulario que se envían en una solicitud HTTP POST. Tales como: 
 
Parseo de Datos, Validación de Datos, Almacenamiento de Datos ,Interacción con la Lógica de la Aplicación y Generación 
de Respuestas 

Repite el experimento varias veces para responder las siguientes preguntas observando las diferencias en el resultado
impreso por nc: 

***¿Cuál es el efecto de agregar parámetros URI adicionales como parte de la ruta POST?***

Agregar parámetros URI adicionales como parte de la ruta POST no tiene un efecto directo en la solicitud POST en sí misma. 

 

***¿Cuál es el efecto de cambiar las propiedades de nombre de los campos del formulario?***

Cambiar las propiedades de nombre de los campos del formulario afecta cómo se nombran los datos en la solicitud POST enviada al servidor. 

 

***¿Puedes tener más de un botón Submit? Si es así, ¿cómo sabe el servidor en cuál se hizo clic? (Sugerencia: experimenta 
con los atributos de la etiqueta <submit>).***

Si se puede tener más de un botón "Submit" en un formulario HTML. Para distinguir en cuál se hizo clic, se utiliza el
atributo name en los botones. Cada botón debe tener un atributo name diferente, y cuando se hace clic en uno de ellos, 
solo ese botón se envía en la solicitud POST al servidor. 

 

***¿Se puede enviar el formulario mediante GET en lugar de POST? En caso afirmativo, ¿cuál es la diferencia en cómo el 
servidor ve esas solicitudes?***

Si se puede enviar el formulario mediante GET en lugar de POST al cambiar el atributo mdthod el formulario a GET. La
principal diferencia es que en una solicitud GET, los datos del formulario se incluyen en la URL como parámetros de
consulta, visible en la barra de direcciones del navegador. 

***¿Qué otros verbos HTTP son posibles en la ruta de envío del formulario? ¿Puedes hacer que el navegador web genere una
ruta que utilice PUT, PATCH o DELETE?.***

Los verbos HTTP más comunes para formularios web son GET y POST. Sin embargo, en teoría, se pueden utilizar otros 
verbos HTTP como PUT, PATCH o DELETE en la ruta de envío del formulario, pero esto depende de la configuración del
servidor web y de la aplicación. 

 

HTTP sin estados y cookies 
![image](https://github.com/Josezapat/CC3S2/assets/90808325/f3aca991-8947-4b0d-8437-21b184f5a0aa)

 

***Pregunta: Prueba las dos primeras operaciones GET anteriores. El cuerpo de la respuesta para la primera debe ser 
"Logged in: false" y para la segunda "Login cookie set". ¿Cuáles son las diferencias en los encabezados de respuesta 
que indican que la segunda operación está configurando una cookie? (Sugerencia: usa curl -v, que mostrará tanto los 
encabezados de solicitud como los encabezados y el cuerpo de la respuesta, junto con otra información de depuración.
curl --help imprimirá una ayuda voluminosa para usar cURL y man curl mostrará la página del manual de Unix para cURL 
en la mayoría de los sistemas.)***

En la primera operación no hay un encabezado Set-Cookie, lo que indica que no establece una cookie. 

En la segunda operación se puede ver el encabezado Set-Cookie: session=logged_in Se puede ver el encabezado loque
indica que la segunda operación está configurando una cookie llamada "session" con el valor "logged_in". 

 

***Pregunta: Bien, ahora supuestamente "logged in" porque el servidor configuró una cookie que indica esto. Sin embargo,
si intentaa GET / nuevamente, seguirá diciendo "Logged: false". ¿Qué está sucediendo? (Sugerencia: usa curl -v y 
observa los encabezados de solicitud del cliente).***

Lo que está sucediendo es que, aunque el servidor configuró una cookie que indica que el usuario ha iniciado sesión, 
el cliente curl no está enviando esa cookie en las solicitudes posteriores. Por lo tanto, el servidor no reconoce al 
usuario como "logged in" en las solicitudes posteriores y muestra "Logged in: false". 

 

***Pregunta: Al observar el encabezado Set-Cookie o el contenido del archivo cookies.txt, parece que podría haber creado
fácilmente esta cookie y simplemente obligar al servidor a creer que ha iniciado sesión. En la práctica, ¿cómo evitan 
los servidores esta inseguridad?***

Los servidores web implementan una combinación de medidas de seguridad para proteger las cookies y garantizar que no se 
pueda engañar fácilmente al sistema para iniciar sesión sin autenticación legítima. Estas medidas incluyen el uso de 
tokens de sesión, firmas y cifrado, registros de servidor y políticas de seguridad. 
