require 'byebug'
def perm(arr)
  return arr if arr.length == 1
  output = []

  arr.length.times do |idx|
    temp = [arr[idx]]
    clone = arr.dup
    clone.delete_at(idx)
    perm_arr = perm(clone)
    perm_arr.each do |el|
      output << temp + [el].flatten
    end
  end
  output
end
