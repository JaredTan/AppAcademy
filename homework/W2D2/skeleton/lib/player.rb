class Player
  attr_reader :name, :side

  def initialize(name, side)
    @name = name
    @side = side
  end

  def prompt
    puts "#{@name}, please enter which cup you would like to start from: "
    start_pos = gets.chomp.to_i
    until start_pos.between?(1,6) && @side == 1 ||
        start_pos.between?(7,12) && @side == 2
      puts "Not your side!"
      start_pos = gets.chomp.to_i
    end
    start_pos
  end
end
