class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    @cups = Array.new(14) { [:stone, :stone, :stone, :stone ] }
    @cups[13] = []
    @cups[6] = []
  end

  def valid_move?(start_pos)
    if start_pos > 12 || start_pos < 0
      raise 'What u doing'
    end
    true
  end

  def make_move(start_pos, current_player_name)
    count = @cups[start_pos].count
    @cups[start_pos] = []
    pos = start_pos
    until count == 0
      p pos
      if current_player_name == @name1 && pos % 14 == 13
        pos += 1
      elsif current_player_name == @name2 && pos % 14 == 6
        pos += 1
      else
        pos += 1
        @cups[pos % 14] << :stone
        count -= 1
      end
    end
    render
    next_turn((pos) % 14, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    if current_player_name == @name1 && ending_cup_idx == 6
      :prompt
    elsif current_player_name == @name2 && ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count > 0
      make_move(ending_cup_idx, current_player_name)
    else
      :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? { |cup| cup.count.zero? } || @cups[7..13].all? { |cup| cup.count.zero? }
      return true
    else
      false
    end
  end

  def winner
    spaceship = @cups[6] <=> @cups[13]
    if spaceship == -1
      return @name2
    elsif spaceship == 0
      return :draw
    else
      return @name1
    end
  end

end
