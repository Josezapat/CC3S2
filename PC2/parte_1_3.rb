
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

  def include?(elt, &block)
    return true if value == elt
    left.include?(elt, &block) if left && (block.nil? || block.call(value, elt) == 0)
    right.include?(elt, &block) if right && (block.nil? || block.call(value, elt) == 0)
    false
  end

  def all?(&block)
    return false unless block.call(value)
    left.all?(&block) if left
    right.all?(&block) if right
    true
  end

  def any?(&block)
    return true if block.call(value)
    left.any?(&block) if left
    right.any?(&block) if right
    false
  end

  def sort
    sorted = []
    sorted += left.sort if left
    sorted << value
    sorted += right.sort if right
    sorted
  end
end
