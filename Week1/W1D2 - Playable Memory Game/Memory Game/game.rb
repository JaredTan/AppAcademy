require_relative "player"
require_relative "board"
require_relative "computer"

class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @dimensions = get_valid_board_size
    @board = Board.new(@dimensions)
    @turn_num = -1
  end

  def play
    setup
    until won?
      switch_player
      puts "#{current_player.name}'s turn."
      display
      move1 = current_player.get_first_valid_move(@board)
      update_board_guess1(move1)
      display
      move2 = current_player.get_second_valid_move(@board)
      update_board_guess2(move1, move2)
      display
    end
    conclude
  end

  def display
    puts "\n\n"
    puts @board.render
    puts "\n\n#{"====" * (@board.grid[0].length - 1)}==\n"
  end

  def setup
    @board.populate(@dimensions)
    @board.render
  end

  def update_board_guess1(move1)
    @board[move1].face_value = :u
    @player2.known_cards[move1] = @board[move1].card_symbol
  end

  def update_board_guess2(move1, move2)
    @player2.known_cards[move2] = @board[move2].card_symbol
    if current_player.guess1 == current_player.guess2
      @player2.matched_cards << move1
      @player2.matched_cards << move2
      @board[move2].face_value = :u unless move2.nil?
      current_player.score += 1
      @turn_num -= 1
    else
      @board[move1].face_value = :d
    end
  end

  def get_valid_board_size
    input = get_board_size
    until valid_board?(input)
      puts 'Enter correct board size.'
      input = get_board_size
    end
    input
  end

  def get_board_size
    print 'Enter Board size ex) 2 3: '
    input = gets.chomp
    input.split(" ").map {|n| n.to_i}
  end


  def valid_board?(dimensions)
    dimensions.reduce(:*).even? && dimensions.length == 2
  end

  def won?
    @board.grid.each do |row|
      return false if row.any? { |card| card.face_value == :d }
    end
    true
  end

  def current_player
    if @turn_num.even?
      return @player1
    end
    @player2
  end

  def switch_player
    @turn_num += 1
  end


  def conclude
    puts "#{@player1.name} wins!" if @player1.score > @player2.score
    puts "#{@player2.name} wins!" if @player2.score > @player1.score
    puts "You tie.  Go home." if @player1.score == @player2.score
    puts "#{@player1.name} score: #{@player1.score}"
    puts "#{@player2.name} score: #{@player2.score}"
  end
end

if __FILE__ == $PROGRAM_NAME
  p1 = Player.new("J-money")
  p2 = ComputerPlayer.new("A-Millie")
  Game.new(p1, p2).play
end
