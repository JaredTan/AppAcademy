class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_turn
    pos = get_pos
    action = reveal_or_flag?
    [pos, action]
  end

  def get_pos
    print "What tile? ex: 1, 2 : ".colorize(:red)
    pos = parse_pos(gets.chomp)
    until valid_pos?(pos)
      print "Please enter a valid tile"
      pos = parse_pos(gets.chomp)
    end
    pos
  end

  def reveal_or_flag? #send this immediately to game, game checks tile, if not cool, call player.reveal_or_flag? again
    print "\n\nReveal or toggle Flag? (r / f) : "
    action = gets.chomp
    until action == 'r' || action == 'f'
      action = gets.chomp
      print "\n\nC'mon, type an r or an f. Really not that hard.. :"
    end
    action
  end

  def parse_pos(pos)
    new_pos = []
    new_pos << pos[0].to_i
    new_pos << pos[-1].to_i
  end

  def valid_pos?(pos)
    return false unless pos.all? { |coord| (0..8).include?(coord) }
    true
  end

end
