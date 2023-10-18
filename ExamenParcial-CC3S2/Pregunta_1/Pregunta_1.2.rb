class OpenClosed

    #El método self.meths(m) devuelve una lista de todos los métodos de instancia y privados de una clase o módulo.

  def self.meths(m)
    m.instance_methods + m.private_instance_methods
  end

  def self.include(*mods)
    mods.each do |mod|
      if (meths(self) & meths(mod)).any?
        raise "Including this module would override existing methods"
      else
        super
      end
    end
  end

  #Se utiliza el método alias_method para arreglar los métodos existentes

  class << self
    alias_method :prepend, :include
    alias_method :extend, :include
  end

  meths(self).each do |method|
    alias_name = :"__#{method}"
    alias_method alias_name, method
  end

  #El método self.method_added(method) se llama cada vez que se agrega un nuevo método a la clase y verifica si el método comienza con un doble guión bajo y si ya está definido. En ese caso, se lanza una excepción.
  
  def self.method_added(method)
    if method.to_s.start_with?("__") && !method_defined?(method.to_s.sub(/^__/, ""))
      raise "No esta permitido anular los metodos de alias"
    else
      alias_method(method, :"__#{method}")
    end
  end
end
