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
