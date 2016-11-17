require 'byebug'
def subset(array)
  debugger
  return [[]] if array.empty?

  smaller_set = subset(array[0...-1])
  smaller_set.concat(smaller_set.map { |el| el + [array[-1]] })
end
