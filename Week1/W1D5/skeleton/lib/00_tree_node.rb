require 'byebug'

class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent)
    @parent.children.delete(self) if @parent
    @parent = parent
    @parent.children << self unless @parent.nil? || @parent.children.include?(self)
  end

  def add_child(child_node)
    @children << child_node
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'Error' unless child_node.parent
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      node.children.each do |child|
        queue << child
      end
    end
    nil
  end

end
