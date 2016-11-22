class Piece
  attr_accessor :value

  def initialize(value, color)
    @value = value
    @color = color
  end

  def to_s
    " #{symbol} "
  end


  def empty?

  end

  def symbol

  end

  def valid_moves

  end

  private
  def move_into_check(to_pos)

  end


end

class NullPiece < Piece
  def initalize(*args)
    super(*args)
  end


end

class Pawn < Piece
  def initalize(*args)
    super(*args)
  end
end

class Rook < Piece
  def initalize(*args)
    super(*args)
  end
end

class Bishop < Piece
  def initalize(*args)
    super(*args)
  end
end

class Knight < Piece
  def initalize(*args)
    super(*args)
  end
end

class King < Piece
  def initalize(*args)
    super(*args)
  end
end

class Queen < Piece
  def initalize(*args)
    super(*args)
  end
end
