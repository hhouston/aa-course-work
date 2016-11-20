class Array

  def my_each(&blk)

    size.times do |i|
      blk.call(self[i])
    end
    self
  end

  def my_select(&blk)
    result_array = []
    my_each { |el| result_array << el if blk.call(el) }
    result_array
  end

  def my_reject(&blk)
    result_array = []
    my_each { |el| result_array << el unless blk.call(el) }
    result_array
  end

  def my_any?(&blk)
    my_each do |el|
      return true if blk.call(el)
    end
    false
  end

  def my_all?(&blk)
    my_each do |el|
      return false unless blk.call(el)
    end

    true
  end

  def my_flatten
    result = []
    my_each do |el|
      if el.is_a?(Array)
        el.my_flatten.my_each { |inner_el| result << inner_el }
      else
        result << el
      end
    end
    result
  end



  # Write my_zip to take any number of arguments.
  # It should return a new array containing self.length
  #  elements. Each element of the new array s
  #  hould be an array with a length of the input
  #  arguments + 1 and contain the merged elements
  #   at that index. If the size of any argument is
  #   less than self, nil is returned for that location.

def my_zip(*arrays)
  return_array = []

  self.length.times do |index|
    temp_array = []
    temp_array << self[index]
    arrays.my_each { |array| temp_array << array[index] }
    return_array << temp_array
  end
  return_array
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

  def my_rotate(rotate_num = 1)
    return_array = []
    size.times do |i|
      return_array << self[(i + rotate_num) % size]
    end
    return_array
  end

  def my_join(separator = '')
    result_str = ''
    my_each { |el| result_str << el + separator }

    result_str[0..-2] if result_str[-1] == separator
  end

  def my_reverse
    result_array = []
    (length - 1).downto(0) do |i|
      result_array << self[i]
    end
    result_array
  end

  #modifies original array
  def bubble_sort!(&prc)
    if prc.nil?
      prc = :<=>.to_proc
    end

    sorted = false
    until sorted
      sorted = true
      (length - 1).times do |i|
        j = i + 1
        if prc.call(self[i], self[j]) == 1
          self[i], self[j] = self[j], self[i]
          sorted = false
        end
      end
    end

    self
  end

  #does not modify original array
  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

end

def factors(num)
  1.upto(num).select { |i| num % i == 0 }
end

def substrings(string)
  result = []
  string.length.times do |i|
    (i + 1).times do |j|
      result << string[j..i]
    end
  end

  result.uniq
end

def subwords(string, dictionary)
  substrings(string).select { |word| dictionary.include?(word) }
end
