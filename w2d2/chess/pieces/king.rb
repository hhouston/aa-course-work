require_relative 'piece'

class King < Piece

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
end
