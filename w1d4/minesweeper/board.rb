class Board
  attr_reader :grid

  def self.default_grid
    Array.new(9) { Array.new(9) { 0 }}
  end

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def setup
    add_bombs
    finish_board
  end

  def add_bombs
    (@grid.size - 1).times do |i|
      (@grid.size - 1).times do |j|
        if rand(10) < 4
          @grid[i][j] = "*"
        end

      end
    end
  end

  def finish_board
    (@grid.size - 1).times do |r|
      (@grid.size - 1).times do |c|
        num = 0
        if @grid[r][c] == 0
          num = bomb_counter(r, c)
          if num.zero?
            @grid[r][c] = "_"
          else
            @grid[r][c] = num
          end
        end
      end
    end
  end

  def bomb_counter(r, c)
    counter = 0

    counter += 1 if @grid[r-1][c-1] == "*"
    counter += 1 if @grid[r-1][c] == "*"
    counter += 1 if @grid[r+1][c+1] == "*"
    counter += 1 if @grid[r][c-1] == "*"
    counter += 1 if @grid[r][c+1] == "*"
    counter += 1 if @grid[r+1][c-1] == "*"
    counter += 1 if @grid[r+1][c] == "*"
    counter += 1 if @grid[r-1][c+1] == "*"


    counter
  end

  def render
    @grid.each { |line| p line }
  end

end

board = Board.new
board.setup
board.render
