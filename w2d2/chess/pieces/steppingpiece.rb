require "byebug"
module SteppingPiece

  def moves
    moves = []
    cur_row,cur_col = pos
    moves_diff.each do |move|
      move_row ,move_col = move

      new_row, new_col = (cur_row + move_row), (cur_col + move_col)
      new_pos = [new_row, new_col]

      next unless board.valid_pos?(new_pos)# within the board

      if board[new_pos].value == nil  # nil value
        moves << new_pos
      elsif board[new_pos].color == self.color # same color
        next
      elsif board[new_pos].color != self.color # different color
        moves << new_pos
        next
      else
        raise "error stepping piece module"
      end

    end
    moves
  end

end

# load 'pieces/king.rb'
# load 'board.rb'
# board = Board.new
# knight = Knight.new("k","black",[0,0],board)
# knight.moves
