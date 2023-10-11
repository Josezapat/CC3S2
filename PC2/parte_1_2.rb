class ArbolBinario
  include Enumerable

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def <<(elemento)
    if elemento <= value
      if left.nil?
        @left = ArbolBinario.new(elemento)
      else
        left << elemento
      end
    else
      if right.nil?
        @right = ArbolBinario.new(elemento)
      else
        right << elemento
      end
    end
  end

  def empty?
    value.nil? && left.nil? && right.nil?
  end

  def each(&block)
    left.each(&block) if left
    yield(value)
    right.each(&block) if right
  end
end

# Ejemplo de uso
Arbol = ArbolBinario.new(10)
[5, 15, 2, 7, 12, 17].each { |elemento| Arbol << elemento }

puts "Elementos del árbol en orden:"
Arbol.each { |elemento| puts elemento }

puts "¿El árbol está vacío? #{Arbol.empty?}"
