require_relative 'tile.rb'

class Board
  attr_accessor :grid, :box1

  def self.default_grid
    Array.new(9) { Array.new(9) }
  end

  def initialize
    @grid = self.class.default_grid
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def rows?
    @grid.all? {|el| el.reduce(:+) == @grid[0].reduce(:+)}
  end

  def render
    (0..8).each do |i|
      print "\n"
      (0..8).each do |j|
        print " " + @grid[i][j].to_s
      end
    end
  end

  def self.from_file(file)
    result = Board.new
    nums_arr = File.readlines(file).map { |arr| arr.split('') }
     (0..8).each do |i|
       (0..8).each do |j|
         result.grid[i][j] = Tile.new(nums_arr[i][j])
       end
     end
     result
  end
end
