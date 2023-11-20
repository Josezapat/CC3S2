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
  
