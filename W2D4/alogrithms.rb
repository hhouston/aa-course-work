def phase_one(array)
  array.each do |el1|
    return el1 if array.all? { |el2| el2 >= el1 }
  end
end

def phase_two(array)
  smallest = nil
  array.each do |el|
    smallest = el if smallest.nil? || el < smallest
  end
  smallest
end

def sub_sums_slow(array)
  subsets = []
  array.length.times do |i|
    j = i
    while j < array.length
      current_subset = array[i..j]
      subsets << current_subset
      j += 1
    end
  end

  largest_sum = nil
  subsets.each do |subset|
    sum = 0
    subset.each do |el|
      sum += el
    end

    largest_sum = sum if largest_sum.nil? || largest_sum < sum
  end
  largest_sum
end

def subsets_sum_fast(array)

  return array.first if array.length == 1

  largest_sum = nil
  sum = subsets_sum_fast(array.take(array.count - 1))
  sum += array.last
  if largest_sum.nil? || sum > largest_sum
    largest_sum = sum
  end
  largest_sum
  # subs += subs.map { |sub1| sub1 + [array.last] }
end

def sum_range(num1, num2)
  return num2 if num2 == num1

  num1 + sum_range(num1 + 1, num2)
end

def largest_continuous_sumbsumm(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |el| el < 0 }

  arr.drop(1),each do |num|
    current = 0 if current < 0


p phase_two([ 0, 3, 5, 4, -5, 10, 1, 90 ])

p sub_sums_slow([2, 3, -6, 7, -6, 7])
p subsets_sum_fast([2, 3, -6, 7, -6, 7])
p subsets_sum_fast([-5, -1, -3])
