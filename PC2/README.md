**Parte 1 Algoritmos, Programación Orientada a Objetos**
**1.1**
```ruby
def encontrar_letra_faltante(cadena)
  alfabeto = "abcdefghijklmnopqrstuvwxyz"
  letras = cadena.downcase.scan(/[a-z]/)
  letras_faltantes = alfabeto.chars - letras
  letras_faltantes.first
end

cadena = "the quick brown box jumps over a lazy dog"
letra_faltante = encontrar_letra_faltante(cadena)
puts "La letra que falta es: #{letra_faltante}"
```
- Definimos la función encontrar_letra_faltante
- Declaramos el alfabeto: alfabeto = "abcdefghijklmnopqrstuvwxyz"
- Extraemos las letras existentes: letras = cadena.downcase.scan(/[a-z]/)
- Luego encontramos las letras faltantes con: letras_faltantes = alfabeto.chars - letras
- Por ultimo obtenemos la letra faltante: letras_faltantes.first
![image](https://github.com/Josezapat/CC3S2/assets/90808325/59b3d87d-d4c3-4af9-8992-890fdb912da8)

Podemos escribir cualquier cadena dentro de "cadena" y letra faltante será la primera letra que falte del albfabeto dentro de la "cadena".

**1.2**



