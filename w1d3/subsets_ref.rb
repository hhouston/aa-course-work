require 'byebug'

def subsets(array)
  return [[]] if array.empty?
  debugger
  subs = subsets(array.take(array.count-1))
  subs.concat(subs.map { |sub| sub + [array.last] })
end


# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
