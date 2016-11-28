require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if board.over? && board.winner != evaluator

    children_array = children

    if evaluator == next_mover_mark
      children_array.none? do |child|
        child.losing_node?(next_mover_mark)
      end
    end

    false
    #
    # if evaluator != next_mover_mark
    #   return children_array.any? do |child|
    #     child.losing_node?(next_mover_mark)
    #   end
    # else
    #   return children_array.all? do |child|
    #     child.losing_node?(next_mover_mark)
    #   end
    # end

  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_positions = board.empty_positions
    children_boards = []

    empty_positions.each do |pos|
      dup_board = board.dup
      dup_board[pos] = next_mover_mark
      mark = next_mover_mark == :x ? :o : :x
      children_boards << TicTacToeNode.new(dup_board, mark, pos)
    end

    children_boards
  end
end
