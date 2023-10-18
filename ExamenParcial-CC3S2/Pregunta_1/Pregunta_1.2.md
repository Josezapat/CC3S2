El método self.meths(m) devuelve una lista de todos los métodos de instancia y privados de una clase o módulo. 
```ruby
class OpenClosed
  def self.meths(m)
    m.instance_methods + m.private_instance_methods
  end
```
El método self.include(*mods) nos permite incluir módulos en la clase, pero tambien verifica si hay conflictos con los métodos existentes antes de hacerlo. 

```ruby
  def self.include(*mods)
    mods.each do |mod|
      if (meths(self) & meths(mod)).any?
        raise "Including this module would override existing methods"
      else
        super
      end
    end
  end
```
Se utiliza el método alias_method para arreglar los métodos existentes

```ruby
  class << self
    alias_method :prepend, :include
    alias_method :extend, :include
  end

  meths(self).each do |method|
    alias_name = :"__#{method}"
    alias_method alias_name, method
  end
```
El método self.method_added(method) se llama cada vez que se agrega un nuevo método a la clase y verifica si el método comienza con un doble guión bajo y si ya está definido. En ese caso, se lanza una excepción. 

```ruby
  def self.method_added(method)
    if method.to_s.start_with?("__") && !method_defined?(method.to_s.sub(/^__/, ""))
      raise "Overriding alias methods is not allowed"
    else
      alias_method(method, :"__#{method}")
    end
  end
end
```



***
**¿Cuándo es una mala idea implementar una abstracción mediante metaprogramación?**
Implementar una abstracción mediante metaprogramación puede ser una mala idea en varios casos como la falta de claridad en el código, 
los errores que a veces son dificiles de depurar, la complejidad del código y la dificultad de poder trabajar con otros desarrolladores que no estén muy familiarizados con la metaprogramación
***
**¿Siempre es malo utilizar abstracciones en el código de prueba?**
No siempre es malo utilizar abstracciones en el código de prueba, ya que el uso de abstracciones en las pruebas puede tener muchos beneficios la Reutilización de código o tambien nos facilita la actualización de pruebas, sin embargo Las abstracciones en las pruebas deben utilizarse con moderación y ser relevantes para los casos de uso específicos. Si se usa mucha abstracción en las pruebas puede hacer que sean difíciles de entender y mantener. Por lo tanto, el equilibrio entre abstracción y simplicidad en las pruebas depende de las necesidades de cada proyecto.
***
