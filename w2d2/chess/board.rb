require_relative 'pieces'

require "byebug"
class Board
  attr_accessor :rows, :board

  def self.make_starting_grid
    board = Array.new(8) do
      Array.new(8) { NullPiece.instance }
    end
    board
  end

  def initialize(board = Board.make_starting_grid)
    @board = board
    @rows = board.each { |row| row }

    place_pawns
    place_back_row
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @rows[row][col] = piece
  end

  def move_piece(start_pos, end_pos)

    start_row, start_col = start_pos
    end_row, end_col = end_pos
    raise "error" if board[start_row][start_col].nil?

    piece_type = board[start_row][start_col].value

    # raise "cant move there error" unless valid_move?(start_pos, end_pos, piece_type)

    self[[end_row, end_col]] = board[start_row][start_col]
    self[[start_row, start_col]] = nil

  end

  def valid_pos?(pos)
    row, col = pos
    row >= 0 && row <= 7 && col >= 0 && col <= 7
  end


  def place_pawns

    8.times do |i|
      self[[i, 1]] = Pawn.new("p","black",[i,1],self)
    end

    8.times do |j|
      self[[j, 6]] = Pawn.new("p","white",[j,1],self)
    end
  end

  def place_back_row
    self[[0,0]] = Rook.new("r","black",[0,0],self)
    self[[7,0]] = Rook.new("r","black",[7,0],self)
    self[[7,7]] = Rook.new("r","white",[7,7],self)
    self[[0,7]] = Rook.new("r","white",[0,7],self)

    self[[1,0]] = Bishop.new("b","black",[1,0],self)
    self[[6,0]] = Bishop.new("b","black",[6,0],self)
    self[[1,7]] = Bishop.new("b","white",[1,7],self)
    self[[6,7]] = Bishop.new("b","white",[6,7],self)

    self[[2,0]] = Knight.new("k","black",[2,0],self)
    self[[5,0]] = Knight.new("k","black",[5,0],self)
    self[[2,7]] = Knight.new("k","white",[2,7],self)
    self[[5,7]] = Knight.new("k","white",[5,7],self)

    self[[3,0]] = King.new("K","black",[3,0],self)
    self[[3,7]] = King.new("K","white",[3,7],self)
    self[[4,0]] = Queen.new("q","black",[4,0],self)
    self[[4,7]] = Queen.new("q","white",[4,7],self)
  end

end
