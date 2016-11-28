# Enumerables
class Array
  def my_each(&prc)
    size.times do |i|
      prc.call(self[i])
    end
    self
  end
end

# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#  puts num
# end.my_each do |num|
#  puts num
# end
# # # => 1
# #     2
# #     3
# #     1
# #     2
# #     3

# p return_value  # => [1, 2, 3]
class Array
  def my_select(&prc)
    return_array = []
    my_each do |el|
      return_array << el if prc.call(el)
    end
    return_array
  end
end

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

class Array
  def my_reject(&prc)
    return_array = []
    my_each do |el|
      return_array << el unless prc.call(el)
    end
    return_array
  end
end
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

class Array
  def my_any?(&prc)
    my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    my_each do |el|
      return false unless prc.call(el)
    end
    true
  end
end

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

class Array
  def my_flatten
    return_array = []
    each do |el|
      el.is_a?(Array) ? return_array += el.my_flatten : return_array << el
    end
    return_array
  end
end
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

def my_controlled_flatten(n)
  return nil if n < 1
  flattened = []

  each do |el|
    el.is_a?(el) ? flattened += el.my_controlled_flatten(n - 1) : flattened << el
  end
  flattened
end

# def my_controlled_flatten(n)
#   return self if n < 1
#   result = []
#
#   each do |el|
#     if el.is_a?(Array)
#       result += el.my_controlled_flatten(n-1)
#     else
#       result << el
#     end
#   end
#
#   result
# end


class Array
  def my_zip(*arrays)
    zipped = []
    each_with_index do |el, index|
      temp = []
      temp << el
      arrays.each do |array|
        temp << array[index]
      end
      zipped << temp
    end
    zipped
  end
end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

class Array
  def my_rotate(positions = 1)
    rotations = positions % size
    rotated = self.dup

    rotations.times do |i|
      rotated << rotated.shift
    end
    rotated
  end
end
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

class Array
  def my_join(seperator = "")
    return_str = ''
    each_with_index do |el, i|
      return_str << el
      return_str << seperator unless i == (self.length - 1)
    end
    return_str
  end
end
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
class Array
  def my_reverse
    reversed = []
    (count - 1).downto(0) do |i|
      reversed << self[i]
    end
    reversed
  end
end
# p ["a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

def factors(num)
  2.upto(num - 1).select { |i| num % i == 0 }
end
# p factors(100)

class Array
  def bubble_sort!(&prc)
    prc ||= proc { |x, y| x <=> y }

    sorted = false
    until sorted == true
      sorted = true
      (self.length - 1).times do |i|
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    self
  end
end

# p [8,1,5,23,6,2].bubble_sort!
class Array
  def bubble_sort(&prc)
    self.dup.bubble_sort!
  end
end
# p [8,1,5,23,6,2].bubble_sort

def substrings(string)
  return_array = []
  string.length.times do |i|
    (i + 1).times do |j|
      return_array << string[j..i]
    end
  end
  return_array
end

# p substrings("hey")

def subwords(word, dictionary)

end

# p substrings("abc")

# def my_join(separator = '')
#   result_str = ''
#   my_each { |el| result_str << el + separator }
#
#   result_str[0..-2] if result_str[-1] == separator
# end
#
# def my_reverse
#   result_array = []
#   (length - 1).downto(0) do |i|
#     result_array << self[i]
#   end
#   result_array
# end
#
# #modifies original array
# def bubble_sort!(&prc)
#   if prc.nil?
#     prc = :<=>.to_proc
#   end
#
#   sorted = false
#   until sorted
#     sorted = true
#     (length - 1).times do |i|
#       j = i + 1
#       if prc.call(self[i], self[j]) == 1
#         self[i], self[j] = self[j], self[i]
#         sorted = false
#       end
#     end
#   end
#
#   self
# end

#does not modify original array
# def bubble_sort(&prc)
#   self.dup.bubble_sort!(&prc)
# end
#
# end
#
# def factors(num)
# 1.upto(num).select { |i| num % i == 0 }
# end
#
# def substrings(string)
# result = []
# string.length.times do |i|
#   (i + 1).times do |j|
#     result << string[j..i]
#   end
# end
#
# result.uniq
# end
#
# def subwords(string, dictionary)
# substrings(string).select { |word| dictionary.include?(word) }
# end

def my_merge(hash2)
  hash1 = self.dup

  hash2.each do |key, value|
    hash1[key] = value
  end
  hash1
end



















# def my_merge(hash2)
#   self_dup = self.dup
#
#   hash2.each do |key, value|
#     self_dup[key] = value
#   end
#   self_dup
# end

# Recursion

def sum_to(num)
  return 1 if num == 1
  return nil if num < 1
  num + sum_to(num - 1)
end

# # Test Cases
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8) # => returns nil



















# def sum_to(num)
#   return 1 if num == 1
#   return nil if num < 1
#   num + sum_to(num - 1)
# end

def add_numbers(array = nil)
  return nil if array.nil?
  return array.first if array.length == 1

  array.first + add_numbers(array[1..-1])
end

# # Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers() # => returns nil





















# def add_numbers(array = nil)
#   return nil if array.nil?
#   return array.first if array.length == 1
#   array[0] + add_numbers(array[1..-1])
# end


def gamma_fnc(num)

end
# Test Cases
# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040























# def gamma_fnc(num)
#   return 1 if num == 1
#   return nil if num == 0
#   (num - 1) * gamma_fnc(num - 1)
# end

# exponents

def exponent1(base, power)
  return 1 if power == 0

  base * exponent1(base, power - 1)
end

# p exponent1(3, 3)
# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)
























# def exponent1(base, power)
#   return 1 if power == 0
#
#   base * exponent1(base, power - 1)
# end

def exponent2(base, power)

end
# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

#deep_dup
class Array
  def deep_dup
    map { |el| el.is_a?(Array) ? el.deep_dup : el }
  end
end
# [1, [2], [3, [4]]]

























# class Array
#   def deep_dup
#     map { |el| el.is_a?(Array) ? el.deep_dup : el }
#   end
# end
#permutations

def permutations(array)
  return [array] if array.length <=1

  first = array.shift
  perms = permutations(array)
  total_perms = []

  perms.each do |perm|
    (0..perms.length).each do |i|
      total_perms << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_perms
end

# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 2, 1], [3, 1, 2]]






























# def permutations(array)
#   return [array] if array.length <= 1
#   first = array.shift
#
#   perms = permutations(array)
#
#   total_permutations = []
#
#   perms.each do |perm|
#     (0..perm.length).each do |i|
#       total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
#     end
#   end
#   total_permutations
# end

# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 2, 1], [3, 1, 2]]

class Array
  def bsearch(target, &prc)
    return nil if size <= 1
    prc ||= proc { |x, y| x <=> y }

    mid = size / 2

    case prc.call(target, self[mid])
    when 0
      mid
    when -1
      self.dup.take(mid).bsearch(target, &prc)
    else
      search_res = self.dup.drop(mid + 1).bsearch(target, &prc)
      search_res.nil? ? nil : search_res + mid + 1
    end

  end
end
#
# p [1, 2, 3, 4, 5, 6].bsearch(6)
# p [1, 2, 3, 4, 5, 6].bsearch(0)


































# class Array
#   def bsearch(target, &prc)
#     prc ||= proc { |x, y| x <=> y }
#     return nil if size == 0
#     midpoint = length / 2
#
#     case prc.call(target, self[midpoint])
#     when 0
#       return midpoint
#     when 1
#       search_res = self[midpoint + 1..-1].bsearch(target, &prc)
#       search_res.nil? ? nil : search_res + midpoint + 1
#     else
#       self[0...midpoint].bsearch(target, &prc)
#     end
#   end
# end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# def my_bsearch(target, &prc)
#   prc ||= proc { |x, y| x <=> y }
#
#   return nil if size == 0
#
#   midpoint = size / 2
#
#   case prc.call(target, self[midpoint])
#   when 0
#     return midpoint
#   when 1
#     search_res = self.dup.drop(midpoint + 1).my_bsearch(target, &prc)
#     search_res.nil? ? nil : midpoint + 1 + search_res
#   else
#     self.dup.take(midpoint).my_bsearch(target, &prc)
#   end
# end
# end

def subsets(array)
  return [[]] if array.empty?

  subs = subsets(array[0..-2])
  subs.concat(subs.map { |el| el + [array.last] })
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

































# def subsets(array)
#   return [[]] if array.empty?
#
#   subs = subsets(array.take(array.count-1))
#   subs.concat(subs.map { |sub| sub + [array.last] })
# end


# p make_better_change(24, [25, 10, 5, 1])


# def make_better_change(target, coins)
#   return [] if target == 0
#   return nil if coins.none? { |coin| coin <= target }
#
#   best_change = nil
#
#   coins.each_with_index do |coin, index|
#
#     remainder = target - coin
#     best_remainder = make_better_change(remainder, coins.drop(index))
#
#     next if best_remainder.nil?
#     this_change = [coin] + best_remainder
#
#
#     if best_change.nil? || best_change.count > this_change.count
#       best_change = this_change
#     end
#
#   end
#   best_change
# end


# p make_better_change(24, [10, 7, 1])

def pascal(n)

end


class Array
  def quicksort(&prc)
    return self if length <= 1
    prc ||= proc { |x, y| x <=> y }

    pivot = self.first

    left_side = self[1..-1].select { |num| prc.call(num, pivot) == -1 }
    right_side = self[1..-1].select { |num| prc.call(num, pivot) != -1 }

    left_side.quicksort + [pivot] + right_side.quicksort
  end
end

# p [9, 4, 6, 19, 2, 99, 1].quicksort

































# class Array
  # def quicksort(&prc)
  #   return self if length < 2
  #
  #   prc ||= proc { |x, y| x <=> y }
  #
  #   pivot = first
  #   left_side = self[1..-1].select { |num| prc.call(num, pivot) == - 1 }
  #   right_side = self[1..-1].select { |num| prc.call(num, pivot) != - 1 }
  #
  #
  #   left_side.quicksort + [pivot] + right_side.quicksort
  # end
# end


# p [9, 4, 6, 19, 2, 99, 1].quicksort
#
# class Array
#   def quicksort
#     return self if self.length < 2
#
#     pivot = self.first
#     left_side = self[1..-1].select { |el| el < pivot }
#     right_side = self[1..-1].select { |el| el >= pivot }
#
#     left_side.quicksort + [pivot] + right_side.quicksort
#   end
# end


# Assessment 1 Test
# Monkey patch the Array class and add a my_inject method. If my_inject receives
# no argument, then use the first element of the array as the default accumulator.
class Array

  def my_inject(accumulator = nil, &prc)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < self.length
      accumulator = prc.call(accumulator, self[i])
      i += 1
    end

    accumulator
  end

end

# p [1, 2, 3].my_inject(1) { |acc, rest| acc + rest }


































  # class Array
  #   def my_inject(accumulator = nil, &block)
  #     i = 0
  #
  #     if accumulator.nil?
  #       accumulator = self.first
  #       i += 1
  #     end
  #
  #     while i < self.length
  #       accumulator = block.call(accumulator, self[i])
  #       i += 1
  #     end
  #
  #     accumulator
  #   end
  # end


# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

  def is_prime?(num)
    (2..num-1).each do |i|
      return true if num % i == 0
    end
    false
  end

  def primes(count)
    ret_arr = []
    i = 2
    until ret_arr.length == count
      ret_arr << i if is_prime?(i)
      i += 1
    end
    ret_arr
  end
# p primes(4)

class Array
# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end































#   def factorial(n)
#     if n == 0
#         1
#     else
#         n * factorial(n-1)
#     end


# puts factorial(5) # =&gt; 120
end


class Array

# Write an Array#dups method that will return a hash containing the indices of all
# duplicate elements. The keys are the duplicate elements; the values are
# arrays of their indices in ascending order, e.g.
# [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h, k| h[k] = [] }

    self.each_with_index do |item, index|
      hash[item] << index
    end
    hash.select { |_, value| value.count > 1 }
  end
end
# p [1, 3, 4, 3, 0, 3, 0].dups # => { 3 => [1, 3, 5], 0 => [4, 6] }

class String

# Write a String#symmetric_substrings method that returns an array of substrings
# that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
# Only include substrings of length > 1.

  def symmetric_substrings
    palindromes = []
    size.times do |i|
      ((i + 1)..size).each do |j|
        next if self[i..j].length < 2
        palindromes << self[i..j] if self[i..j] == self[i..j].reverse
      end
    end
    palindromes.uniq
  end
end

# p "fadedaf".symmetric_substrings


# class Array

# Write an Array#merge_sort method; it should not modify the original array.

#   def merge_sort(&prc)
#     return self if size <= 1
#     prc ||= proc { |x, y| x <=> y }
#     midpoint = size / 2
#
#     left = self[0...midpoint].merge_sort(&prc)
#     right = self[midpoint..-1].merge_sort(&prc)
#
#     Array.merge(left, right, &prc)
#   end
#
#   private
#   def self.merge(left, right, &prc)
#     merged = []
#     until left.empty? || right.empty?
#       case prc.call(left.first, right.first)
#       when -1
#         merged << left.first
#       else
#         merged << right.first
#       end
#       merged + left + right
#
#     end
#   end
# end

# p [92, 3, 2, 23, 231, 35, 63].merge_sort










































class Array

# Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if length <= 1
    prc ||= proc { |x, y| x <=> y }
    midpoint = size / 2

    left_side = self[0...midpoint].merge_sort(&prc)
    right_side = self[midpoint..-1].merge_sort(&prc)

    self.class.merge(left_side, right_side, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged + left + right
  end

end

p [92, 3, 2, 23, 231, 35, 63].merge_sort










































def my_map

end

def my_queue

end

def my_stack

end

# EXERCISE 1
# class Stack
#   def initialize
#     @stack = []
#   end
#
#   def add(el)
#     @stack << el
#     el
#   end
#
#   def remove
#     @stack.pop
#   end
#
#   def show
#     @stack.dup
#   end
# end
#
#
#
# # EXERCISE 2
# class Queue
#   def initialize
#     @queue = []
#   end
#
#   def enqueue(el)
#     @queue << el
#     el
#   end
#
#   def dequeue
#     @queue.shift
#   end
#
#   def show
#     @queue.dup
#   end
# end

# EXERCISE 3
# class Map
#   def initialize
#     @map = []
#   end
#
#   def assign(key, value)
#     pair_index = @map.index {|pair| pair[0] == key}
#     pair_index ? @map[pair_index][1] = value : @map.push([key, value])
#     [key, value]
#   end
#
#   def lookup(key)
#     @map.each {|pair| return pair[1] if pair[0] == key}
#     nil
#   end
#
#   def remove(key)
#     @map.reject! {|pair| pair[0] == key}
#     nil
#   end
#
#   def show
#     deep_dup(@map)
#   end
#
#   private
#   def deep_dup(arr)
#     arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
#   end
# end
# bfs & dfs

# class PolyTreeNode
#   attr_reader :value, :children, :parent
#
#   def initialize(value)
#     @value = value
#     @children = []
#     @parent = nil
#   end
#
#   def parent=(value)
#     parent.children.delete(self) if parent
#     @parent = value
#     parent.children << self if parent
#   end
#
#   def add_child(child_node)
#     child_node.parent = self
#   end
#
#   def remove_child(child_node)
#     raise 'Not a child' unless child_node.parent == self
#     child_node.parent = nil
#   end
#
#   def dfs(target_value)
#     return self if value == target_value
#
#     children.each do |child|
#       current_result = child.dfs(target_value)
#       return current_result if current_result
#     end
#
#     nil
#   end
#
#   def bfs(target_value)
#     queue = [self]
#
#     until queue.empty?
#       current_node = queue.shift
#
#       return current_node if current_node.value == target_value
#       current_node.children.each { |child| queue << child }
#     end
#
#     nil
#   end
# end

# require_relative 'poly_tree_node.rb'
#
# class KnightPathFinder
#   attr_reader :start_pos, :visited_positions, :root_node
#
#   MOVE_RULES = [
#     [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]
#   ].freeze
#
#   def self.valid_moves(pos)
#     row, col = pos
#     next_moves = MOVE_RULES.map { |move| [row + move[0], col + move[1]] }
#     next_moves.select! { |pos| valid_move?(pos) }
#     next_moves
#   end
#
#   def self.valid_move?(pos)
#     row, col = pos
#     row < 8 && row >= 0 && col < 8 && col >= 0
#   end
#
#   def initialize(start_pos)
#     @start_pos = start_pos
#     @visited_positions = [start_pos]
#     build_move_tree
#   end
#
#   def trace_path_back(final_node)
#     path_array = [final_node.value]
#     parent_node = final_node.parent
#
#     while parent_node
#       path_array << parent_node.value
#       parent_node = parent_node.parent
#     end
#
#     path_array
#   end
#
#
#   def find_path(finish_pos)
#     final_node = root_node.bfs(finish_pos)
#     trace_path_back(final_node).reverse
#   end
#
#   def build_move_tree
#     @root_node = PolyTreeNode.new(start_pos)
#
#     queue = [root_node]
#
#     until queue.empty?
#       current_node = queue.shift
#       next_positions = self.class.valid_moves(current_node.value)
#       next_positions.select! { |pos| unvisited_move?(pos) }
#
#       next_positions.each do |pos|
#         @visited_positions << pos
#         child_node = PolyTreeNode.new(pos)
#         child_node.parent = current_node
#         queue << child_node
#       end
#     end
#     puts 'tree built'
#   end
#
#   def unvisited_move?(pos)
#     visited_positions.none? { |visited_pos| visited_pos == pos }
#   end
# end
#
#
# kpf = KnightPathFinder.new([0, 0])
# # p kpf.find_path([3,3])
# p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
# p kpf.find_path([7, 7])
