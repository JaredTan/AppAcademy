class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_move
    print "Pick a letter: "
    user_guess = gets.chomp
    until ("a".."z").include?(user_guess)
      print "Please provide a letter: "
      user_guess = gets.chomp
    end

    user_guess
  end


end
