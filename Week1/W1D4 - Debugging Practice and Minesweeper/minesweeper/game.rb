require_relative 'board'
require_relative 'player'
require 'colorize'
class Minesweeper

  attr_reader :board, :player

  def initialize(player)
    @board = Board.new
    @player = player
  end

  def play
    until board.over?
      puts "\n\n"
      puts board.render
      puts "\n\n"
      handle_player_move(player.get_turn)
    end
    puts "\n\n"
    puts board.render
    puts "\n\n"
    happy_ending if won?
    sad_ending
  end


  def handle_player_move(player_move)
    pos, tile, action = player_move[0], board[player_move[0]], player_move[1]

    if tile.revealed
      player_bad_move
    elsif tile.flagged && action == 'r'
      player_bad_move
    elsif action == 'r'
      board.explosion(pos)
    else
      tile.toggle_flag
    end
  end

  def player_bad_move
    print 'whoops. turns out you couldn\'t figure out how to do this properly. Try again.'
    play
  end

  def won?
    board.grid.each do |row| #lose
      row.any? { |tile| return false if tile.has_bomb && tile.revealed }
    end

    true
  end

  def happy_ending
    print 'Great job! You won and stuff!'
    exit
  end

  def sad_ending
    puts 'um guess what'
    sleep(3.5)
    system('clear')
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                    idk i guess Minesweeper is hard.. hmm\n\n\n\n\n\n\n\n\n\n\n\n\n\n".red.blink
  end

end

if __FILE__ == $PROGRAM_NAME
  p1 = Player.new('ravi')
  Minesweeper.new(p1).play
end
