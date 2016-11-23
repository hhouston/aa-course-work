require_relative 'piece'
require_relative 'steppingpiece'

class Knight < Piece
  include SteppingPiece
  def initalize(*args)
    super(*args)
  end

  def symbol
    if self.color == "black"
      "♟".colorize(:black)
    else
      "♟".colorize(:cyan)
    end
  end

  protected
  def moves_diff
    moves = [[-2,-1],[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2]]
  end
end
