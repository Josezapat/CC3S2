function greatestNumber(array) {
    if (array.length === 0) {
      return null; // Manejar el caso de un array vacío según tus necesidades
    }
  
    let maxNumber = array[0];
  
    for (let i = 1; i < array.length; i++) {
      if (array[i] > maxNumber) {
        maxNumber = array[i];
      }
    }
  
    return maxNumber;
  }
  