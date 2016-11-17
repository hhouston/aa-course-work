require 'byebug'

def bsearch(array, target)
  midpoint = array.length / 2

  return midpoint if target == array[midpoint]
  return nil if array.length <= 1
  # debugger

  if target < array[midpoint]
    bsearch(array[0...midpoint], target)
  else
    response = bsearch(array[midpoint + 1..-1], target)
    response.nil? ? nil : midpoint + 1 + response
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6)
