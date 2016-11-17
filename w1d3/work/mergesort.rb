def mergesort(array)
  midpoint = array.length / 2
  left_side = array[0...midpoint]
  right_side = array[midpoint..-1]

  return array if array.length <= 1

  merge(mergesort(left_side), mergesort(right_side))
end

def merge(left, right)
  return_array = []
  puts "left: " + left.to_s + "right: " + right.to_s
  until left.empty? || right.empty?
    if left.first > right.first
      return_array << right.shift
    else
      return_array << left.shift
    end
  end
  return_array + left + right
end
