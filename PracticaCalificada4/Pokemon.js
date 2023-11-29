// Clase Pokémon
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
  
  // Clase Charizard que hereda de Pokemon
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
  
  // Ejemplo de uso
  try {
    const charizard = new Charizard(100, 50, 30, "lanzar llamas");
    charizard.flight();
    console.log(`¿Puede volar? ${charizard.canFly()}`);
    console.log(`Poder de ataque: ${charizard.fight()}`);
  } catch (error) {
    console.error(error.message);
  }
  
  