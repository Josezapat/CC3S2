 

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

***
**Clausuras**
Un paradigma popular en Javascript es el uso de clausuras. Al igual que las funciones de orden superior en Python, las clausuras son combinaciones de una función agrupada con referencias a su estado circundante. Las clausuras le dan acceso al alcance de una función externa desde una función interna. Determina la salida del siguiente código.

Después de Instalar Node.js y Npm copiamos el código en Visual Studio Code y lo ejecutamos desde Git bash:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/34dc7fc0-4b67-4ef7-9070-69870e629c22)
***
**Algoritmos**
La siguiente función encuentra el mayor número dentro de un array, pero tiene una eficiencia de O(N2). Reescribe la función para que se convierta en una O(N) más rápida:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/009a35e8-b8dc-4631-823e-800b03f8cff3)

Este código tiene una complejidad de tiempo de O(N), ya que solo recorre el array una vez para encontrar el número más grande.
***

¿Cuál es la complejidad temporal de esta función en términos de notación O grande? Luego, modifica el código para mejorar la eficiencia del algoritmo en los mejores y promedios escenarios.
- La función original containsX tiene una complejidad temporal de O(N), donde N es la longitud de la cadena. Esto se debe a que la función recorre cada carácter de la cadena para verificar si hay una "X".

***
Escribe una función que devuelva el primer carácter no duplicado de una cadena. Por ejemplo, la cadena "mínimum" tiene dos caracteres que solo existen una vez: la n y la u, por lo que su función debería devolver la n, ya que aparece primero. La función debe tener una eficiencia de O(N).

- Esta función tiene una eficiencia de O(N), ya que recorre la cadena dos veces, pero ambas iteraciones tienen una complejidad de tiempo lineal en relación con la longitud de la cadena.
- 
```ruby
function primerNoDuplicado(cadena) {
  // Inicializar un mapa para realizar un seguimiento de la frecuencia de cada carácter
  const frecuencia = new Map();

  // Recorrer la cadena para contar la frecuencia de cada carácter
  for (let i = 0; i < cadena.length; i++) {
    const caracter = cadena[i];
    frecuencia.set(caracter, (frecuencia.get(caracter) || 0) + 1);
  }

  // Buscar el primer carácter no duplicado
  for (let i = 0; i < cadena.length; i++) {
    const caracter = cadena[i];
    if (frecuencia.get(caracter) === 1) {
      return caracter;
    }
  }

  // Si no se encuentra ninguno, devolver null o un valor predeterminado según sea necesario
  return null;
}

// Ejemplo de uso
const cadenaEjemplo = "mínimum";
const resultado = primerNoDuplicado(cadenaEjemplo);
console.log(resultado); // Debería imprimir: "n"
```
***
Clases
Practiquemos la herencia y la programación orientada a objetos en Javascript. Diseñe 2 clases, una llamada "Pokemon" y otra llamada "Charizard". 

- Este código define las clases Pokemon y Charizard y crea dos instancias de Charizard con movimientos diferentes.

```ruby
class Pokemon {
    constructor(HP, ataque, defensa) {
      this.HP = HP;
      this.ataque = ataque;
      this.defensa = defensa;
      this.movimiento = "";
      this.nivel = 1;
      this.tipo = "";
    }
  
    flight() {
      throw new Error("No se especificó ningún movimiento.");
    }
  
    canFly() {
      if (!this.tipo) {
        throw new Error("No se especificó ningún tipo.");
      }
      return this.tipo.includes("volar");
    }
  }
  
  class Charizard extends Pokemon {
    constructor(HP, ataque, defensa, movimiento) {
      super(HP, ataque, defensa);
      this.movimiento = movimiento;
      this.tipo = "disparar/volar";
    }
  
    fight() {
      if (this.movimiento) {
        console.log(`Utilizando el movimiento: ${this.movimiento}`);
        return this.ataque;
      } else {
        throw new Error("No se especificó ningún movimiento.");
      }
    }
  }
  
  // Ejemplo de uso:
  const charizard1 = new Charizard(100, 30, 20, "Lanzallamas");
  const charizard2 = new Charizard(100, 30, 20, "Garra Dragón");
  
  console.log("Charizard 1:");
  console.log(charizard1.fight());
  console.log(charizard1.canFly());
  
  console.log("\nCharizard 2:");
  console.log(charizard2.fight());
  console.log(charizard2.canFly());
  ```

Y cuando lo ejecutamos obtenemos:

![image](https://github.com/Josezapat/CC3S2/assets/90808325/5bc90f6f-dd0e-4fd6-aead-f8f143c07191)

