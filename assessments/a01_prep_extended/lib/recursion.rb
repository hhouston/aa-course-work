require "byebug"

class RecursionMachine

  # Implement a method that finds the sum of the first n
  # fibonacci numbers recursively. Assume n > 0
  def fibs_sum(n)
    return 0 if n == 0
    return 1 if n == 1

    1 + fibs_sum(n - 1) + fibs_sum(n - 2)
  end

  #returns all subsets of an array
  def subsets(array)
    return [[]] if array.empty?

    subs = subsets(array[0..-2])
    subs.concat(subs.map { |el| el + [array.last] })
  end


  # return the sum of the first n even numbers recursively. Assume n > 0
  def first_even_numbers_sum(n)
    return 2 if n == 1

    2 * n + first_even_numbers_sum(n - 1)
  end

  # return b^n recursively. Your solution should accept negative values
  # for n
  def exponent(b, n)
    return 1 if n == 0

    b * exponent(b, n - 1)
  end

  # make better change problem from class
  def make_better_change(value, coins)

  end

  #deep dup question from class
  def deep_dup(arr)
    # return_array = []
    #
    # arr.each do |el|
    #   if el.is_a?(Array)
    #     return_array << deep_dup(el)
    #   else
    #     return_array << el
    #   end
    # end
    # return_array

    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

  # Write a recursive method that takes in a string to search and a key string.
  # Return true if the string contains all of the characters in the key
  # in the same order that they appear in the key.
  #
  # string_include_key?("cadbpc", "abc") => true
  # string_include_key("cba", "abc") => false
  def string_include_key?(string, key)
    return true if key.length == 0

    next_key_char = key.chars.first
    key_index = string.index(next_key_char)

    return false if key_index.nil?
    string_include_key?(string[key_index + 1..-1], key[1..-1])
  end

  # Write a recursive function that returns the prime factorization of
  # a given number. Assume num > 1
  #
  # prime_factorization(12) => [2,2,3]
  def prime_factorization(num)
    return [] if num == 1

    (2..Math.sqrt(num).ceil).each do |i|
      if num % i == 0
        return [i] + prime_factorization(num / i)
      end
    end
    return [num]
  end

  def is_prime?(num)
    (2...num).each do |i|
      return false if num % i == 0
    end
    true
  end

  # Write a method, `digital_root(num)`. It should Sum the digits of a positive
  # integer. If it is greater than 10, sum the digits of the resulting number.
  # Keep repeating until there is only one digit in the result, called the
  # "digital root". **Do not use string conversion within your method.**
  #
  # You may wish to use a helper function, `digital_root_step(num)` which performs
  # one step of the process.

  def digital_root(num)
    digit_array = []

    while num > 0
      digit_array << num % 10
      num /= 10
    end

    digit_sum = digit_array.inject(&:+)
    digit_sum > 10 ? digital_root(digit_sum) : digit_sum
  end

  # Write a recursive method that takes in a base 10 number n and
  # converts it to a base b number. Return the new number as a string
  #
  # E.g. base_converter(5, 2) == "101"
  # base_converter(31, 16) == "1f"

  def base_converter(num, b)

  end

  # CHALLENGE: Eight queens puzzle precursor
  #
  # Write a recursive method that generates all 8! possible unique ways to
  # place eight queens on a chess board such that no two queens are in
  # the same board row or column (the same diagonal is OK).
  #
  # Each of the 8! elements in the return array should be an array of positions:
  # E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
  #
  # My solution used 3 method parameters: current_row, taken_columns, and
  # positions so far
  def eight_queens_possibilities(current_row, taken_columns, positions)

  end

end
