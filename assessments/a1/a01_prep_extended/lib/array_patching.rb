require 'byebug'
class Array

  def my_each(&prc)
    count.times do |idx|
      prc.call(self[idx])
    end
    self
  end

  def my_each_with_index(&prc)
    count.times do |index|
      prc.call(self[index], index)
    end
    self
  end

  def my_select(&prc)
    return_array = []
    my_each { |item| return_array << item if prc.call(item) }
    return_array
  end

  def my_reject(&prc)
    return_array = []
    my_each { |item| return_array << item unless prc.call(item) }
    return_array
  end

  def my_any?(&prc)
    my_each { |item| return true if prc.call(item) }
    false
  end

  def my_all?(&prc)
    my_each { |item| return false unless prc.call(item) }
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    return_array = []
    my_each do |item|
      item.is_a?(Array) ? return_array += item.my_flatten : return_array << item
    end
    return_array
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n < 1
    return_array = []
    my_each do |el|
      if el.is_a?(Array)
        return_array += el.my_controlled_flatten(n - 1)
      else
        return_array << el
      end
    end
    return_array
  end

  def my_zip(*arrs)
    return_array = []
    my_each_with_index do |item, index|
      temp_array = []
      temp_array << item

      arrs.my_each do |el|
        temp_array << el[index]
      end
      return_array << temp_array
    end
    return_array
  end

  def my_rotate(num = 1)
    rotations = num % count
    return_array = self.dup

    rotations.times do
      return_array << return_array.shift
    end
    return_array
  end

  # def my_join(str = "")
  #   return_string = ""
  #   my_each do |item|
  #     return_string += item + str
  #   end
  #   return_string = return_string[0..-2] if return_string[-1..-1] == str
  #   return_string
  # end

  def my_join(str = '')
    return_str = ''

    my_each_with_index do |el,i|
      return_str += el.to_s
      return_str << str unless i == size - 1
    end

    return_str
  end

  # def my_reverse
  #   reverse_array = []
  #
  #   (count - 1).downto(0) do |index|
  #     reverse_array[index] = self.shift
  #   end
  #
  #   reverse_array
  # end

  def my_reverse
    reversed = []
    my_each { |el| reversed.unshift(el) }
    reversed
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if size < 2
    prc ||= proc { |x, y| x <=> y }

    pivot = self.first
    left = self[1..-1].select { |num| prc.call(num, pivot) == - 1 }
    right = self[1..-1].select { |num| prc.call(num, pivot) != - 1 }

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    prc ||= proc { |x, y| x <=> y }

    return nil if size == 0

    midpoint = size / 2

    case prc.call(target, self[midpoint])
    when 0
      return midpoint
    when 1
      search_res = self.dup.drop(midpoint + 1).my_bsearch(target, &prc)
      search_res.nil? ? nil : midpoint + 1 + search_res
    else
      self.dup.take(midpoint).my_bsearch(target, &prc)
    end
  end
end
