class ComputerPlayer

  attr_accessor :name, :matched_cards, :known_cards, :guess1, :guess2, :score

  def initialize(name)
    @name = name
    @known_cards = {}
    @matched_cards = []
    @score = 0
    @guess1_pos = nil
    @guess1 = nil
    @guess2 = nil
  end

  def get_first_valid_move(board)
    move = [rand(board.grid.length), rand(board.grid[0].length)]
    until valid_move?(move, board)
      move = [rand(board.grid.length), rand(board.grid[0].length)]
    end
    @guess1 = board[move].card_symbol
    @guess1_pos = move
    move
  end


  def get_second_valid_move(board)
    @known_cards.keys.each do |position|
      if second_valid_move?(board, position)
        return position
      end
    end
    move = [rand(board.grid.length), rand(board.grid[0].length)]
    until valid_move?(move, board)
      move = [rand(board.grid.length), rand(board.grid[0].length)]
    end
    @guess2 = board[move].card_symbol
    move
  end

  def second_valid_move?(board, position)
    return false if @known_cards[position] == board[@guess1_pos].card_symbol
    return false if position != @guess1_pos
    return false if !@matched_cards.include?(position)
    return false if board[position].display_symbol.nil?
    true
  end

  def valid_move?(move, board)
    return false if board[move].face_value == :u
    return false if @matched_cards.include?(move)
    true
  end


end
