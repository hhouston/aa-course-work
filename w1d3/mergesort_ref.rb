class Array
  def mergesort
    return self if self.length == 1

    midpoint = self.length / 2
    left_side, right_side = self.take(midpoint), self.drop(midpoint)

    merge(left_side.mergesort, right_side.mergesort)
  end

  def merge(left_side, right_side)
    sorted_array = []

    until left_side.empty? || right_side.empty?
      # if left_side.first > right_side.first
      #   sorted_array << right_side.shift
      # else
      #   sorted_array << left_side.shift
      # end
      sorted_array <<
        ((left_side.first < right_side.first) ? left_side.shift : right_side.shift)
    end

    sorted_array + left_side + right_side
  end
end

p [9, 4, 6, 19, 2, 99, 1].mergesort
