 

1. Preguntas Conceptuales 
***
a. En JavaScript, todas las operaciones de red son asíncronas. ¿Por qué es esto importante? 

Esto es importante porque JavaScript se ejecuta en un entorno de un solo hilo (single-threaded), lo que significa que solo puede realizar una tarea a la vez. Si las operaciones de red fueran síncronas (bloqueantes), podrían causar que la interfaz de usuario se congele y no responda mientras espera que las operaciones de red se completen. Al ser asíncronas, las operaciones de red pueden ejecutarse en segundo plano sin bloquear la ejecución del resto del código, lo que permite una experiencia de usuario más fluida. 

 ***

b. En JavaScript, queremos realizar acciones tras una operación/solicitud de red 

 completa. ¿Qué paradigma de programación hace esto posible? 

El paradigma de programación que hace esto posible es el de callbacks o el uso de promesas. JavaScript utiliza callbacks para manejar operaciones asíncronas, lo que significa que se pueden proporcionar funciones que se ejecutarán después de que la operación asíncrona se complete. Además, las promesas proporcionan una forma más estructurada y fácil de manejar operaciones asíncronas. 

 ***

c. ¿JavaScript proporciona soporte limitado para la herencia a través de qué mecanismo? 

JavaScript proporciona soporte limitado para la herencia a través del mecanismo de prototipos. Los objetos en JavaScript pueden heredar propiedades y métodos de otros objetos a través de sus prototipos. Aunque JavaScript no sigue una herencia de clases tradicional como en otros lenguajes, la herencia basada en prototipos permite compartir y extender funcionalidades entre objetos. 
***
d. ¿Qué es el DOM? ¿Qué librería nos ayuda a usar JavaScript para manipular el DOM? 

El DOM (Document Object Model) es una representación del documento HTML que se carga en el navegador y que JavaScript puede manipular dinámicamente. La librería que nos ayuda a usar JavaScript para manipular el DOM es jQuery. Aunque hay otras librerías y el uso directo de JavaScript es común, jQuery simplifica muchas operaciones y manejo de eventos en el DOM. 

***
e. ¿Qué puede hacer JavaScript? 

JavaScript es un lenguaje de programación versátil que puede realizar una amplia gama de tareas. Algunas de sus capacidades incluyen manipulación del DOM, manejo de eventos, operaciones asíncronas (AJAX), creación de interfaces de usuario interactivas, desarrollo de aplicaciones web completas (usando frameworks como React), control del flujo de la aplicación del lado del cliente, y mucho más. 
