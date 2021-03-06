class PosNode

  attr_reader :parent, :children, :pos

  def initialize(pos)
    @parent = nil
    @children = []
    @pos = pos
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

  def bfs(target_pos)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.pos == target_pos
      node.children.each do |child|
        queue << child
      end
    end
    nil
  end

  def dfs(target_pos)
    return self if @pos == target_pos
    @children.each do |child|
      node = child.dfs(target_pos)
      return node if node
    end
    nil
  end


end
