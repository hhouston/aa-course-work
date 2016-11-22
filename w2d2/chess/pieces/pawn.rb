require_relative 'piece'

class Pawn < Piece
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

  def moves


  end

  protected
  def at_start_row?

  end

  def forward_dir

  end

  def forward_steps

  end

  def side_attacks

  end
end
