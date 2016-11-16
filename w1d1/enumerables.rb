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

  def my_zip(*arrays)
    result_array = []
    self.length.times do |i|
      other_array = []
      other_array << self[i]
      arrays.my_each { |array| other_array << array[i] }
      result_array << other_array
    end
    result_array
  end

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
