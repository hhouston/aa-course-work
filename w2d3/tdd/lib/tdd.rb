class Array

  def my_uniq
    uniques = []
    self.each do |el|
      uniques << el unless uniques.include?(el)
    end
    uniques
  end

  def two_sum
    sums = []
    size.times do |i|
      (i+1).upto(size-1) do |j|
        sums << [i,j] if self[i] + self[j] == 0
      end
    end
    sums
  end

  def transpose
    new_mat = Array.new(self.first.length) { Array.new(self.length) }

    self.first.length.times do |row_idx|
      self.length.times do |col_idx|
        new_mat[row_idx][col_idx] = self[col_idx][row_idx]
      end
    end
    new_mat
  end

  def stock_picker
    best_diff = 0
    best_days = []
    size.times do |i|
      (i + 1).upto(size - 1) do |j|
        if self[j] - self[i] > best_diff
          best_diff = self[j] - self[i]
          best_days = [i, j]
        end
      end
    end
    best_days.empty? ? nil : best_days
  end
end

class TowersOfHanoi
  attr_reader :stacks

  def initialize(start_array)
    @stacks = [start_array, [], []]
  end

  def move_disc(start_index, end_index)
    raise_test = start_index.is_a?(Fixnum) && end_index.is_a?(Fixnum)
    raise "Not a stack" unless raise_test
    if valid_move?(start_index, end_index)
      stacks[end_index] << stacks[start_index].shift
    end
  end

  def valid_move?(start_index, end_index)
    return false if stacks[start_index].empty?
    if stacks[end_index].empty?
      return true
    elsif stacks[start_index].first > stacks[end_index].first
      return false
    end
    true
  end

  def won?
    stacks_test = stacks[1].empty? || stacks[2].empty?
    return true if stacks[0].empty? && stacks_test
    false
  end

  def play

    until won?
      puts 'What stack to move from'
      start_index = gets.chomp.to_i

      puts "What stack to move to?"
      end_index = gets.chomp.to_i

      move_disc(start_index, end_index)
      print stacks
      puts ''
    end

  end

end
