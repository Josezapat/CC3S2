#!/usr/bin/env node

const fs = require('fs');

// Recuperar los argumentos de la línea de comandos
const args = process.argv.slice(2);

// Manejar casos en los que no se proporciona la cadena de búsqueda
if (args.length < 2) {
  console.log('Uso: ./grep.js cadena_busqueda [indicadores] archivo1 [archivo2 ...]');
  process.exit(1);
}

// Obtener la cadena de búsqueda y removerla de los argumentos
const searchString = args.shift();

// Configurar opciones predeterminadas
let options = {
  showLineNumbers: false,
  showFileNamesOnly: false,
  caseInsensitive: false,
  invertMatch: false,
  matchWholeLine: false
};

// Procesar los indicadores
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

// Función principal que realiza la búsqueda
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

      const outputLine = options.showLineNumbers ? `${lineNumber + 1}:${line}` : line;
      console.log(options.showFileNamesOnly ? file : outputLine);
    }
  });
}

// Procesar cada archivo proporcionado
args.forEach(grep);
