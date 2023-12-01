***Testing Java Script y Ajax***

José Daniel Zapata Ancco / 20202230A

***

Agregamos Jasmine a nuestro Gemfile:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/f5d4c4cf-a9b0-4cb8-8991-5226fc76374f)

Revisando y leyendo el repositorio  https://jasmine.github.io/setup/ruby.html

Pude insertar correctamente los comandos de esta manera:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/566f10f7-f3f4-4ca5-986d-14b007c5575a)

Automáticamente se nos abre un servidor web http://localhost:8888 donde se visualiza esta interfaz gráfica:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/5891a6b8-ab16-47e6-95ad-7ae07adaba31)

**Pregunta: ¿Cuáles son los problemas que se tiene cuando se debe probar Ajax?. Explica tu respuesta.**

Probar código que involucra Ajax puede presentar varios desafíos. Tales como Asincronía, Dependencia de la red, Acceso cruzado (Cross-Origin Resource Sharing - CORS) y los Manejo de errores, ya que las solicitudes Ajax pueden fallar, ya sea por problemas de red, errores en el servidor u otros problemas imprevistos.

**Pregunta: ¿Qué son los stubs, espias y fixture en Jasmine para realizar pruebas de Ajax?**

Stubs (Burlones): Los stubs en Jasmine son funciones simuladas que reemplazan funciones reales durante las pruebas. En el contexto de pruebas Ajax, puedes usar stubs para simular llamadas Ajax y controlar su comportamiento. 

Espías (Spies): Los espías en Jasmine nos permiten observar el comportamiento de funciones durante las pruebas sin modificar su implementación real. Se puede usar espías para verificar si se llamó a funciones Ajax específicas, cuántas veces se llamaron y con qué argumentos.

Fixtures: Los fixtures son datos de prueba que se utilizan para simular respuestas Ajax. En lugar de depender de una llamada Ajax real, podemos cargar datos de prueba directamente desde un archivo o estructura de datos. Esto permite pruebas más predecibles y controladas, sin depender de la red.

