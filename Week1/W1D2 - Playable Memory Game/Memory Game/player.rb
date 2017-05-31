class Player

  attr_accessor :name, :score, :guess1, :guess2, :known_cards, :matched_cards

  def initialize(name)
    @name = name
    @score = 0
    @guess1 = nil
    @guess2 = nil
    @known_cards = {}
    @matched_cards = []
  end

  def get_first_valid_move(board)
    move1 = get_move1
    until valid_move?(move1, board)
      print "Choose a correct position ex.: "
      move1 = get_move1
    end
    @guess1 = board[move1].card_symbol
    move1
  end

  def get_second_valid_move(board)
    move2 = get_move2
    until valid_move?(move2, board)
      print "Choose a correct position ex.: "
      move2 = get_move2
    end
    @guess2 = board[move2].card_symbol
    move2
  end

  def get_move1
    print "Choose a first position ex. 9 2: "
    move = gets.chomp
    move.split(" ").map {|n| n.to_i}
  end

  def get_move2
    print "Choose a second position ex. 3 6: "
    move = gets.chomp
    move.split(" ").map {|n| n.to_i}
  end

  def valid_move?(move, board)
    return false unless move.length == 2
    return false if board.grid[0].length < move[0] || board.grid[1].length < move[1]
    return false if board[move].face_value == :u
    true
  end


end
