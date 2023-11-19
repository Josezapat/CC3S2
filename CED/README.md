**Actividad: código limpio, manejo de excepciones, depuración** 

José Daniel Zapata Ancco / 20202230A 

***

1. Comparación de Principios entre Ruby y JavaScript en Manejo de Errores: 

Ambos lenguajes comparten similitudes en conceptos clave de manejo de errores, como el uso de bloques try-catch y la importancia de mensajes de error claros. Sin embargo, hay diferencias en la forma en que abordan la jerarquía de excepciones y la recomendación de pruebas unitarias. 

- Jerarquía de Excepciones: 

Ruby: Se enfoca en crear una jerarquía de excepciones específicas de la aplicación. 

JavaScript: También utiliza objetos de error y permite la creación de errores personalizados, pero no enfatiza explícitamente la jerarquía de excepciones. 

- Manejo Preciso de Excepciones: 

Ruby: Aboga por controlar el mínimo de excepciones necesario para cumplir con la responsabilidad única. 

JavaScript: Utiliza bloques try-catch-finally para manejar excepciones, permitiendo el control preciso. 

- Resistir la Tentación de Manejar Excepciones de Inmediato: 

Ruby: Sugiere resistir la tentación de manejar excepciones de inmediato y pensar en un lugar más apropiado para controlarlas. 

JavaScript: Ofrece bloques try-catch que facilitan la gestión diferida de excepciones. 

- No Controlar Todas las Excepciones: 

Ruby: Recomienda no controlar todas las excepciones, exponiendo algunas para mantener la flexibilidad. 

JavaScript: También permite decidir qué excepciones capturar y cuáles dejar propagar, dando flexibilidad. 

- Seguir Convenciones de Nomenclatura: 

Ruby: Enfatiza seguir convenciones, como el uso de "!" para indicar métodos peligrosos. 

JavaScript: No menciona convenciones de nomenclatura específicas, pero sugiere hacer mensajes de error significativos. 

- Registro de Excepciones: 

Ruby: Destaca la importancia de registrar excepciones para la resolución de problemas. 

JavaScript: Menciona el uso de console.log() y el uso del statement debugger para depuración. 

- Validación de Datos de Entrada: 

Ruby: No aborda directamente la validación de datos de entrada. 

JavaScript: Recomienda validar datos de entrada para prevenir errores causados por datos inesperados. 

- Mensajes de Error Significativos: 

Ruby: Enfatiza la importancia de mensajes de error claros y significativos. 

JavaScript: Sugiere mensajes de error claros para ayudar a desarrolladores y usuarios a entender la causa. 

- Pruebas Unitarias: 

Ruby: No menciona específicamente las pruebas unitarias. 

JavaScript: Destaca la importancia de las pruebas unitarias para atrapar errores antes de la producción. 

Linters y Formateadores: 

Ruby: No menciona específicamente el uso de linters o formateadores. 

JavaScript: Sugiere el uso de ESLint y Prettier para mantener un estilo de código consistente. 

Manejo de Errores Asíncronos: 

Ruby: No aborda específicamente el manejo de errores asincrónicos. 

JavaScript: Explica cómo manejar errores asincrónicos con bloques try-catch y el método .catch(). 

Manejo de Errores en Event Listeners o Callbacks: 

Ruby: No aborda explícitamente el manejo de errores en eventos o devoluciones de llamada. 

JavaScript: Proporciona ejemplos de cómo envolver eventos o devoluciones de llamada con bloques try-catch. 
***
 

2. Leer y replicar el tutorial https://www.toptal.com/ruby/how-to-set-up-a-microservices-architecture e indicar cuales son las principales diferencias en utilizar una arquitectura orientada  a Microservicios y la de Cliente-Servidor vista en clase con Rails. 

 

La arquitectura de microservicios y la arquitectura cliente-servidor en Rails son enfoques diferentes para diseñar y estructurar aplicaciones. Aquí hay algunas de las principales diferencias entre ambas: 

- Escalabilidad: 

- Microservicios: La arquitectura de microservicios está diseñada para ser altamente escalable. Cada microservicio es una unidad independiente que puede escalar de manera aislada. Esto permite escalar solo los servicios que necesitan más recursos, lo que mejora la eficiencia. 

Cliente-Servidor en Rails: Tradicionalmente, la arquitectura cliente-servidor en Rails se basa en un servidor monolítico. La escalabilidad suele lograrse escalando verticalmente el servidor monolítico. Si bien puede haber estrategias para mejorar la escalabilidad (como fragmentación de la base de datos), no es tan flexible como la arquitectura de microservicios. 

- Desacoplamiento: 

Microservicios: Los microservicios son unidades independientes y desacopladas. Cada microservicio puede tener su propia base de datos y puede ser desarrollado y desplegado de manera independiente. Esto facilita la innovación y el cambio en partes específicas de la aplicación sin afectar otras. 

Cliente-Servidor en Rails: En una aplicación monolítica de Rails, las partes de la aplicación están fuertemente acopladas. Los modelos, vistas y controladores suelen depender unos de otros. Cambios en una parte pueden afectar otras, lo que puede hacer que la aplicación sea más difícil de escalar y mantener. 

- Despliegue Continuo: 

Microservicios: La arquitectura de microservicios favorece el despliegue continuo, ya que cada microservicio puede ser desplegado y actualizado de manera independiente. Esto permite una entrega más rápida de nuevas características y correcciones de errores. 

Cliente-Servidor en Rails: En una aplicación monolítica, los despliegues continuos pueden ser más desafiantes debido al acoplamiento. Actualizar una parte puede requerir pruebas exhaustivas para garantizar que no haya efectos secundarios en otras áreas de la aplicación. 

- Tecnología y Políglota: 

Microservicios: Cada microservicio puede estar desarrollado en un lenguaje diferente y puede utilizar tecnologías específicas para sus necesidades. Esto permite elegir la mejor herramienta para cada tarea. 

Cliente-Servidor en Rails: En una aplicación monolítica, hay una dependencia más fuerte en el lenguaje y las tecnologías específicas de Rails para toda la aplicación. 

- Complejidad: 

Microservicios: Si bien ofrecen beneficios en términos de escalabilidad y despliegue, también introducen una mayor complejidad en términos de administración de múltiples servicios, comunicación entre servicios y coordinación. 

Cliente-Servidor en Rails: Puede ser más fácil de entender y administrar en una fase inicial, pero a medida que la aplicación crece, puede volverse más difícil mantener una arquitectura monolítica. 

 
