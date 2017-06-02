class Tile
  attr_accessor :adjacent_bombs, :has_bomb, :flagged, :false, :revealed

  def initialize
    @flagged = false
    @has_bomb = false
    @revealed = false
    @adjacent_bombs = 0
  end

  def reveal
    @revealed = true
  end

  def toggle_flag
    @flagged = !flagged
  end

  def display #add in support for adjacent_bombs
    if revealed
      if has_bomb
        'b'.colorize(:black)
      elsif adjacent_bombs != 0
        adjacent_bombs.to_s.colorize(:blue)
      else #empty releaved tile
        '_'
      end
    else
      if flagged
        'f'.colorize(:green)
      else #unflagged unexplored
        '*'.colorize(:orange)
      end
    end
  end
end
