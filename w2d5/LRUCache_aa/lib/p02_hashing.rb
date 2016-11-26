class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0.hash
    self.each do |el|
      sum += el.hash
      sum = sum.hash
    end
    (sum.hash + self.length.hash).hash
  end
end

class String
  def hash
    str_arr = self.split("")
    sum = 0
    str_arr.each_with_index do |el, i|
      sum += (el.ord + i).hash
      sum = sum.hash
    end
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = self.length.hash
    sorted_keys = self.keys.sort
    sorted_keys.each do |key|
      sum = sum.hash + self[key].ord.hash
      sum += sum.hash
    end

    self.length.times { sum = sum.hash }

    sum
  end
end
