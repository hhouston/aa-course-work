require "colorize"
require_relative"cursor"
require_relative "board"
require"byebug"

class Display
  attr_accessor :cursor, :board
  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0, 0], board, false)
  end

  def move(new_pos)
    @cursor.get_input
  end

  def build_grid
    @board.board.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == cursor.cursor_pos && cursor.selected
      bg = :light_green
    elsif [i, j] == cursor.cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_black
    else
      bg = :light_white
    end
    { background: bg }
  end


  def render

    # board.each_with_index do |row, i|
    #   row_output = ""
    #   row.each_with_index do |square, j|
    #     if square.is_a?(NullPiece)
    #       row_output += "_"
    #     elsif
    #       row_output += "P"
    #     end
    #
    #     @cursor.cursor_pos == [i, j]
    #
    #   # p "#{i} #{rows.join(" ")}"
    #   end
    #   puts row_output
    # end

    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }

    # @cursor.get_input
  end
end
# dp = Display.new
# dp.render
