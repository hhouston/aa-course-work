def range(start, idx_end)

  return [] if idx_end < start
  return [idx_end] if start == idx_end

  [start] + range(start + 1, idx_end)

end

# p range(5,15)

def sum_rec(arr)
return arr.last if arr.length == 1

arr[0] + sum_rec(arr[1..-1])
end

p sum_rec([1,2,3,4,5])
