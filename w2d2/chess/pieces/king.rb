require_relative 'piece'
require_relative 'steppingpiece'

class King < Piece
  include SteppingPiece
  def initalize(*args)
    super(*args)
  end

  def symbol
    if self.color == "black"
      "♚".colorize(:black)
    else
      "♚".colorize(:cyan)
    end
  end

  protected
  def moves_diff
    moves = [[-1,-1],[-1,0],[1,-1],[0,-1],[0,1],[-1,1],[0,1],[1,1]]
  end
end
