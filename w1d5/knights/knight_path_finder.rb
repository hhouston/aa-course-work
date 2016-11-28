require 'byebug'
require_relative 'poly_tree_node.rb'

class KnightPathFinder
  attr_reader :start_pos, :visited_positions, :root_node

  MOVE_RULES = [
    [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]
  ].freeze

  def self.valid_moves(pos)
    row, col = pos
    next_moves = MOVE_RULES.map { |move| [row + move[0], col + move[1]] }
    next_moves.select! { |pos| valid_move?(pos) }
    next_moves
  end

  def self.valid_move?(pos)
    row, col = pos
    row < 8 && row >= 0 && col < 8 && col >= 0
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
    build_move_tree
  end

  def trace_path_back(final_node)
    path_array = [final_node.value]
    parent_node = final_node.parent

    while parent_node
      path_array << parent_node.value
      parent_node = parent_node.parent
    end

    path_array
  end


  def find_path(finish_pos)
    final_node = root_node.bfs(finish_pos)
    trace_path_back(final_node).reverse
  end

  def build_move_tree
    @root_node = PolyTreeNode.new(start_pos)

    queue = [root_node]

    until queue.empty?
      current_node = queue.shift
      next_positions = self.class.valid_moves(current_node.value)
      next_positions.select! { |pos| unvisited_move?(pos) }

      next_positions.each do |pos|
        @visited_positions << pos
        child_node = PolyTreeNode.new(pos)
        child_node.parent = current_node
        queue << child_node
      end
    end
    puts 'tree built'
  end

  def unvisited_move?(pos)
    visited_positions.none? { |visited_pos| visited_pos == pos }
  end
end


kpf = KnightPathFinder.new([0, 0])
# p kpf.find_path([3,3])
p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
p kpf.find_path([7, 7])
