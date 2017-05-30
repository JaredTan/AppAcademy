require_relative 'player'

class GhostGame
  attr_reader :fragment, :dictionary

  def initialize(player_one, player_two)
    @fragment = ""
    @d = File.readlines('dictionary.txt')
    @d.map!(&:chomp)
    @player_one = player_one
    @player_two = player_two
    @turn_no = -1
    @losses = { "player_one" => 0, "player_two" => 0 }
    @ghost = "GHOST"
  end

  def run
    until @losses["player_one"] == 5 || @losses["player_two"] == 5
      play_round
    end
    conclude
  end

  def play_round
    until over?
      play_turn
    end
    sub_conclude
    @fragment = ""
  end

  def over?
    no_words_start_with_same_letters? || same_word?
  end

  def no_words_start_with_same_letters?
    # if any of the indices of word match all the indices of the fragment
    # then game continues, and nobody lost.
    @d.each do |word|
      return false if @fragment.chars == word.chars[0, @fragment.length]
    end
    true
  end

  def same_word?
    @d.each { |word| return true if word == @fragment }
    false
  end

  def play_turn
    switch_players
    puts "#{current_player.name}'s turn"
    user_guess = current_player.get_move
    @fragment << user_guess
    puts "fragment: #{@fragment}"
  end

  def current_player
    return @player_one if @turn_no.even?
    @player_two
  end

  def switch_players
    @turn_no += 1
  end

  def sub_conclude
    if current_player == @player_one
      puts "#{@player_two.name} wins round."
      @losses["player_one"] += 1
      p @losses
      puts "#{@player_one.name}'s board = #{@ghost[0...@losses['player_one']]}"
    elsif current_player == @player_two
      puts "#{@player_one.name} wins round."
      @losses["player_two"] += 1
      p @losses
      puts "#{@player_two.name}'s board = #{@ghost[0...@losses['player_two']]}"
    end
  end

  def conclude
    puts "#{@player_two.name} wins game" if @losses["player_one"] == 5
    puts "#{@player_one.name} wins game" if @losses["player_two"] == 5
  end

end

if __FILE__ == $PROGRAM_NAME
  print "player_one what is your name?: "
  p1 = Player.new(gets.chomp)
  print "player_two what is your name?: "
  p2 = Player.new(gets.chomp)

  GhostGame.new(p1, p2).run
end
