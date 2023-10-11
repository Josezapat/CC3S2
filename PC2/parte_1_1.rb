def encontrar_letra_faltante(cadena)
  alfabeto = "abcdefghijklmnopqrstuvwxyz"
  letras = cadena.downcase.scan(/[a-z]/)
  letras_faltantes = alfabeto.chars - letras
  letras_faltantes.first
end

cadena = "the quick brown box jumps over a lazy dog"
letra_faltante = encontrar_letra_faltante(cadena)
puts "La letra que falta es: #{letra_faltante}"
