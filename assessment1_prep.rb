# Enumerables

def my_each(&prc)

end

# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#  puts num
# end.my_each do |num|
#  puts num
# end
# # => 1
#     2
#     3
#     1
#     2
#     3
#
# p return_value  # => [1, 2, 3]

def my_select(&prc)

end

# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []


def my_reject(&prc)

end

# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]


def my_any?(&prc)

end

# a = [1, 2, 3]
# a.my_any? { |num| num > 1 } # => true
# a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true

def my_flatten(&prc)


end

# [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


def my_zip(*arrays)


end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

def my_rotate(posistions = 1)
end
# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a.my_rotate(15)     #=> ["d", "a", "b", "c"]


def my_join(seperator = "")
end
# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"

def my_reverse
end
# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]

def factors(num)

end

def bubble_sort!(&prc)

end

def bubble_sort(&prc)

end

def substrings(string)

end

def subwords(word, dictionary)

end

# Recursion

def sum_to(num)

end

# Test Cases
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
# Test Cases Γ(n) = (n-1)!
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

def expontent1(base, power)

end
# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exponent2(base, power)

end
# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

#deep_dup

def deep_dup

end

# [1, [2], [3, [4]]]

#permutations

def permutations(array)

end
# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 2, 1], [3, 1, 2]]

def bsearch(array, target_value)

end
# bsearch([1, 2, 3], 1) # => 0
# bsearch([2, 3, 4, 5], 3) # => 1
# bsearch([2, 4, 6, 8, 10], 6) # => 2
# bsearch([1, 3, 4, 5, 9], 5) # => 3
# bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def subsets(array)

end

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def make_better_change(target, coins = [25, 10, 5, 1])

end


# p make_better_change(24, [10, 7, 1])

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

def pascal(n)

end


class Array
  def quicksort

  end
end


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


# Assessment 1 Test
# Monkey patch the Array class and add a my_inject method. If my_inject receives
# no argument, then use the first element of the array as the default accumulator.
class Array
  def my_inject(accumulator = nil, &block)

  end


# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

  def is_prime?(num)

  end

  def primes(num)

  end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

  def factorials_rec(num)

  end
end

class Array

# Write an Array#dups method that will return a hash containing the indices of all
# duplicate elements. The keys are the duplicate elements; the values are
# arrays of their indices in ascending order, e.g.
# [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups

  end

end

class String

# Write a String#symmetric_substrings method that returns an array of substrings
# that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
# Only include substrings of length > 1.

  def symmetric_substrings

  end
end

class Array

# Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)

  end

  private
  def self.merge(left, right, &prc)

  end
end
