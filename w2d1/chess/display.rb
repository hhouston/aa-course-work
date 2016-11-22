require "colorize"
require_relative"cursor"
require"byebug"

class Display
  attr_accessor :cursor, :board
  def initialize(board)
    @cursor = Cursor.new([0, 0], board, false)
    @board = board
  end

  def build_grid
    @board.map.with_index do |row, i|
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
      bg = :light_blue
    else
      bg = :light_yellow
    end
    { background: bg }
  end


  def render
    # puts "  #{(0..8).to_a.join(" ")}"
    # board.each_with_index do |row, i|
    #   puts "#{i} #{row.join(" ")}"
    # end
    # debugger

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
    # @cursor.get_input
    # p @cursor.cursor_pos

    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }

    @cursor.get_input
  end
end
