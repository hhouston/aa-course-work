def sum_to(num)
  return 1 if num == 1
  return nil if num < 1
  num + sum_to(num - 1)
end

# Test Cases
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8) # => returns nil

def add_numbers(array = nil)
  return nil if array.nil?
  return array.first if array.length == 1
  array[0] + add_numbers(array[1..-1])
end

# # Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers() # => returns nil

def gamma_fnc(num)
  return 1 if num == 1
  return nil if num == 0
  (num - 1) * gamma_fnc(num - 1)
end
# Test Cases Γ(n) = (n-1)!
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040
