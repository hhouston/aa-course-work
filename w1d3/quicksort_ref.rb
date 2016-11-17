class Array
  def quicksort
    return self if self.length < 2

    pivot = self.first
    left_side = self[1..-1].select { |el| el < pivot }
    right_side = self[1..-1].select { |el| el >= pivot }

    left_side.quicksort + [pivot] + right_side.quicksort
  end
end

p [9, 4, 6, 19, 2, 99, 1].quicksort
