**Practica Calificada 4**

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


