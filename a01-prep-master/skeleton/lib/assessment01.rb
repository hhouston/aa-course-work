require 'byebug'

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.
class Array
  def my_inject(accumulator = nil, &block)
    i = 0

    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < self.length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end

    accumulator
  end
end


# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)

  (2...num).each do |j|
    return false if num % j == 0
  end

  true
end

def primes(num)
  return_array = []
  i = 2
  until num == return_array.length
    return_array << i if is_prime?(i)
    i += 1
  end

  return_array
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  byebug
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    return_hash = Hash.new { |hash, value| hash[value] = [] }

    each_with_index do |item, index|
      return_hash[item] << index
    end

    return_hash.select { |_, value| value.count > 1 }

  end

end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    return_array = []
    (0..self.length-1).each do |i|
      (i+1).upto(self.length-1) do |j|
        next if self[i..j].length < 2
        return_array << self[i..j] if self[i..j] == self[i..j].reverse
      end
    end
    return_array
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = self.length / 2
    left_side = self.take(midpoint).merge_sort(&prc)
    right_side = self.drop(midpoint).merge_sort(&prc)

    Array.merge(left_side, right_side, &prc)
  end

  private
  def self.merge(left, right, &prc)
    return_array = []
  until left.empty? || right.empty?

    case prc.call(left, right, &prc)
    when -1
      return_array << left.shift
    when 0
      return_array << right.shift
    when 1
      return_array << right.shift
    end
  end

  return_array + left + right
  end
end
