require "colorize"
class Piece
  attr_accessor :value, :pos, :color

  def initialize(value, color, pos)
    @value = value
    @color = color
    @pos = pos
  end

  def to_s
    " #{symbol} "
  end


  def empty?

  end

  def symbol

  end

  def valid_moves()

  end

  private
  def move_into_check(to_pos)

  end


end
