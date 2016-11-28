class PolyTreeNode
  attr_reader :value, :children, :parent

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(value)
    parent.children.delete(self) if parent
    @parent = value
    parent.children << self if parent
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'Not a child' unless child_node.parent == self
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if value == target_value

    children.each do |child|
      current_result = child.dfs(target_value)
      return current_result if current_result
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      current_node = queue.shift

      return current_node if current_node.value == target_value
      current_node.children.each { |child| queue << child }
    end

    nil
  end
end
