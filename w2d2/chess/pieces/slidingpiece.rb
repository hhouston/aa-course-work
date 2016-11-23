require 'byebug'
module SlidingPiece

  DIAGONAL = [[-1, -1], [1, 1], [1, -1], [-1, 1]]
  HORIZONTAL = [[-1, 0], [0, 1], [1, 0], [0, -1]]

  def moves
    moves = []
    move_dirs.each do |dx, dy|
      moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end
    moves
  end

  private
  def grow_unblocked_moves_in_dir(dx, dy)
    other_moves = []
    cur_row, cur_col = pos

    loop do
      cur_row, cur_col = cur_row + dx, cur_col + dy
      new_pos = [cur_row, cur_col]

      break unless board.valid_pos?(new_pos)
      if board[new_pos].value == nil
        other_moves << new_pos
      elsif board[new_pos].color == self.color
        break
      elsif board[new_pos].color != self.color
        other_moves << new_pos
        break
      else
        raise "error sliding piece module"
      end

    end
    other_moves
  end

  def diagonal_dirs
    DIAGONAL
  end

  def horiz_and_vert_dirs
    HORIZONTAL
  end
end

# load 'pieces/rook.rb'
# load 'board.rb'
# board = Board.new
# rook = Rook.new("r","black",[0,0],board)
# rook.moves
