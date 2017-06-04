class Simon
  COLORS = %w(r b g y)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    puts "\n\n\n\n\n\n\n\n\n\n Ready?"
    sleep(2)
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    i = 0
    until i == @sequence_length
      puts "\n\n\n\n\n\n\n\n\n\n\n\n"
      puts "#{i + 1}: #{@seq[i]} \n\n\n\n\n\n\n\n\n\n\n"
      sleep(0.75) if @sequence_length < 6
      sleep(0.5) if @sequence_length > 5
      i += 1
    end
  end

  def require_sequence
    i = 1
    until i == @seq.length + 1
      puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nInput color number #{i}: r / b / g / y : "
      answer = gets.chomp
      unless answer == @seq[i - 1]
        game_over
        i = @seq.length
      end
      i += 1
    end
  end

  def game_over
    @game_over = true
  end

  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    puts 'Great job! Adding another color. '
  end

  def game_over_message
    puts 'Sorry, you lost'
    puts "The sequence was #{@seq.length} color(s) long."
    sleep(1)
  end

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
    print "Play another? y/n : "
    Simon.new.play if gets.chomp == 'y'
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
