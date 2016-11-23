require_relative 'piece'
require_relative 'slidingpiece'

class Queen < Piece
  include SlidingPiece

  def initalize(*args)
    super(*args)
  end

  def symbol
    if self.color == "black"
      "♛".colorize(:black)
    else
      "♛".colorize(:cyan)
    end
  end

  def move_dirs
    horiz_and_vert_dirs
    diagonal_dirs
  end

end
