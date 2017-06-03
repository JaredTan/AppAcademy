require_relative 'pos_node'

class KnightPathFinder

  attr_reader :start_pos, :visited_positions, :new_move_positions, :root

  def initialize(start_pos = [0, 0])
    @start_pos = start_pos
    @current_pos = start_pos
    @visited_positions = [start_pos]
    @new_move_positions = []
    @root = PosNode.new(start_pos)
    @path_arr = [@start_pos]
  end

  def find_path(end_pos)
    end_node = @root.dfs(end_pos)
    trace_back_path(end_node)
      @path_arr.dup
  end

  def trace_back_path(end_node)
    current_node = end_node
    return current_node if current_node.parent.nil?
    result = trace_back_path(current_node.parent)
    @path_arr << current_node.pos
  end


  def build_move_tree

    nodes_queue = [@root]

    until nodes_queue.empty?
      current_node = nodes_queue.shift
      new_positions = new_move_positions(current_node.pos)
      new_positions.each do |pos|
        new_node = PosNode.new(pos)
        nodes_queue << new_node
        current_node.add_child(new_node)
      end
    #  p ( current_node.children.map { |child| child.pos } )
    end

    nil
  end

  def valid_moves(pos)
    x = pos[0]
    y = pos[1]
    all_pos_arr = [
      [x - 1, y - 2],
      [x - 1, y + 2],
      [x - 2, y - 1],
      [x - 2, y + 1],
      [x + 1, y - 2],
      [x + 1, y + 2],
      [x + 2, y - 1],
      [x + 2, y + 1],
    ]
    possible_moves_arr = all_pos_arr.select do |pos|
      pos.all? { |coord| (0..7).include?(coord) }
    end
    #delete positions that have already been visited
    # @visited_positions.each { |pos2| possible_moves_arr.delete(pos2) }
    # possible_moves_arr
    possible_moves_arr

  end

  def new_move_positions(pos)
    moves = valid_moves(pos)
    actual_valid_moves = []
    moves.each do |pos|
      unless @visited_positions.include?(pos)
        actual_valid_moves << pos
        @visited_positions << pos
      end
    end
    actual_valid_moves
  end

end



  if __FILE__ == $PROGRAM_NAME
    start_pos = [0,0]
    chess_board = KnightPathFinder.new([0, 0])
    chess_board.build_move_tree
    p chess_board.find_path([6, 2])


  end
