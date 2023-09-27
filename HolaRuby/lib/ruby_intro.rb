# Parte 1

def sum(arr)
  arr.reduce(0, :+)
end

def max_2_sum(arr)
  sorted_arr = arr.sort.reverse
  sorted_arr.take(2).reduce(0, :+)
end

def sum_to_n?(arr, n)
  arr.combination(2).any? { |pair| pair.sum == n }
end

# Parte 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant?(s)
  /^[b-df-hj-np-tv-z]/i.match?(s)
end

def binary_multiple_of_4?(s)
  return false unless /^[01]+$/.match?(s)
  s.to_i(2) % 4 == 0
end

# Parte 3

class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    if isbn.empty? || price <= 0
      raise ArgumentError, 'ISBN  no puede estar vacío.'
    end

    @isbn = isbn
    @price = price
  end

  def price_as_string
    format('$%.2f', price)
  end
end


