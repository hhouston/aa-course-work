require_relative 'piece'
require_relative 'display'
require_relative "cursor"

require "byebug"
class Board
  attr_accessor :board, :piece, :display

  def self.make_starting_grid
    board = Array.new(8) do
      Array.new(8) { NullPiece.new(nil, nil) }
    end
    board
  end

  def initialize(board = Board.make_starting_grid)
    @board = board

    place_pawns
    place_back_row
    play_turn
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def move_piece(start_pos, end_pos)

    start_row, start_col = start_pos
    end_row, end_col = end_pos
    raise "error" if board[start_row][start_col].nil?

    piece_type = board[start_row][start_col].value

    raise "cant move there error" unless valid_move?(start_pos, end_pos, piece_type)

    self[[start_row,start_col]] = nil
    self[[end_row,end_col]] = board[start_row][start_col]
  end

  def valid_move?(start_pos, end_pos, piece_type)
    return true
  end


  def place_pawns

    8.times do |pawn_piece|
      self[[pawn_piece, 1]] = Pawn.new("p","black")
    end

    8.times do |pawn_piece|
      self[[pawn_piece, 6]] = Pawn.new("p","white")
    end
  end

  def place_back_row
    self[[0,0]] = Rook.new("r","black")
    self[[7,0]] = Rook.new("r","black")
    self[[7,7]] = Rook.new("r","white")
    self[[0,7]] = Rook.new("r","white")

    self[[1,0]] = Bishop.new("b","black")
    self[[6,0]] = Bishop.new("b","black")
    self[[1,7]] = Bishop.new("b","white")
    self[[6,7]] = Bishop.new("b","white")

    self[[2,0]] = Knight.new("k","black")
    self[[5,0]] = Knight.new("k","black")
    self[[2,7]] = Knight.new("k","white")
    self[[5,7]] = Knight.new("k","white")

    self[[3,0]] = King.new("K","black")
    self[[3,7]] = King.new("K","white")
    self[[4,0]] = Queen.new("q","black")
    self[[4,7]] = Queen.new("q","white")
  end

  def play_turn
    display = Display.new(board)

    while true
      display.render

    end
  end
end

board = Board.new
