require_relative 'board.rb'
require 'byebug'

class Game
  BOX1 = [[0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]]
  BOX2 = [[0,3], [0,4], [0,5], [1,3], [1,4], [1,5], [2,3], [2,4], [2,5]]
  BOX3 = [[0,6], [0,7], [0,8], [1,6], [1,7], [1,8], [2,6], [2,7], [2,8]]

  BOX4 = [[3,0], [3,1], [3,2], [4,0], [4,1], [4,2], [5,0], [5,1], [5,2]]
  BOX5 = [[3,3], [3,4], [3,5], [4,3], [4,4], [4,5], [5,3], [5,4], [5,5]]
  BOX6 = [[3,6], [3,7], [3,8], [4,6], [4,7], [4,8], [5,6], [5,7], [5,8]]

  BOX7 = [[6,0], [6,1], [6,2], [7,0], [7,1], [7,2], [8,0], [8,1], [8,2]]
  BOX8 = [[6,3], [6,4], [6,5], [7,3], [7,4], [7,5], [8,3], [8,4], [8,5]]
  BOX9 = [[6,6], [6,7], [6,8], [7,6], [7,7], [7,8], [8,6], [8,7], [8,8]]

  attr_reader :board
  attr_accessor :guess_index, :guess_value

  def initialize(file_name)
    @board = Board.from_file(file_name)
  end

  def get_guess
    p 'where?'
    temp_guess_index = gets.chomp
    row = temp_guess_index.scan(/\d/)[0].to_i
    col = temp_guess_index.scan(/\d/)[1].to_i
    @guess_index = [row, col]

    p 'what?'
    @guess_value = gets.chomp
  end

  def row?
    @board.grid.each do |row|
      return true unless row.any? { |el| el == guess_value }
    end
  end

  def col?
    col_array = @board.grid.values_at(guess_index[1])
    return true unless col_array.include?(guess_value)
  end

  def box?
    case
    when BOX1.include?(guess_index)
      puts'in BOX1'
      BOX1.each do |index|
        row, col = index
        # p "value " + @board.grid[row][col].value.to_s + "guess value " + guess_value.to_s
        if @board.grid[row][col].value.to_s == guess_value.to_s
          puts 'number already in box'
          return false
        end
      end
      puts 'number not in box'
      true
    when BOX2.include?(guess_index)
      puts 'in BOX2'
    when BOX3.include?(guess_index)
      puts 'in BOX3'
    when BOX4.include?(guess_index)
      puts 'in BOX4'
    when BOX5.include?(guess_index)
      puts 'in BOX5'
    when BOX6.include?(guess_index)
      puts 'in BOX6'
    when BOX7.include?(guess_index)
      puts 'in BOX7'
    when BOX8.include?(guess_index)
      puts 'in BOX8'
    when BOX9.include?(guess_index)
      puts 'in BOX9'
    else
      puts 'ahhhh'
    end
  end

  def valid_move?
    if row? && col? && box?
      true
    else
      false
    end
  end

  def play
    puts 'here is board: '
    board.render

    puts 'enter stuff'
    get_guess

    if valid_move?
      print board[guess_index].value = guess_value
      board.render
    else print 'NOT VALID'
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    file_name = ARGV.shift
  else
    file_name = 'sudoku1.txt'
  end
  @game = Game.new(file_name)
  @game.play
end
