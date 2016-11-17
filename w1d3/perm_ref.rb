require 'byebug'

def permutations(array)
  return [array] if array.length <= 1

  
  debugger

  first = array.shift

  perms = permutations(array)

  total_permutations = []



  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_permutations
end

permutations([1, 2]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 2, 1], [3, 1, 2]]
