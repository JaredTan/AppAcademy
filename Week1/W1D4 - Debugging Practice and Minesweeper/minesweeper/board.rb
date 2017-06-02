require_relative 'tile'

class Board

  attr_reader :grid

  def default_grid
    Array.new(9) do
      Array.new(9) {Tile.new}
    end
  end

  def initialize(grid = default_grid)
    @grid = grid
    populate_with_bombs
  end

  def populate_with_bombs
    bombs_still_to_place = 70
    until bombs_still_to_place == 0
      pos = rand(9), rand(9)
      unless self[pos].has_bomb
        self[pos].has_bomb = true
        bombs_still_to_place -= 1
      end
    end
    set_tile_bomb_count
  end

  def set_tile_bomb_count
    grid.each_index do |row|
      grid[row].each_index do |col|
        adjacent_bomb_count([row, col])
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def render
    display_grid = @grid.map do |row|
      row.map { |tile| tile.display }
    end
    display_grid.unshift(['0   1   2   3   4   5   6   7   8'])

    display_grid.map! { |line| line.join(' | '.colorize(:blue)) }
    "               #{display_grid.join("\n               #{"----" * (@grid[0].length - 1)}--\n               ".colorize(:blue))}"
  end

  def over?

    no_bomb_tiles = []

    grid.each do |row| #gets non bomb tiles and checks if they all are revealed
      row.each do |tile|
        no_bomb_tiles << tile unless tile.has_bomb
      end
    end
    return true if no_bomb_tiles.all? { |tile| tile.revealed }

    grid.each do |row| #lose
      row.any? { |tile| return true if tile.has_bomb && tile.revealed }
    end

    grid.each do |row| #some bombless tiles are unrevealed
      row.any? { |tile| return false unless tile.has_bomb && tile.revealed }
    end

    true
  end

  def adjacent_bomb_count(pos)
    count = 0
    adjacent_locations_arr(pos).each do |location|
      count += 1 if self[location].has_bomb
    end
    self[pos].adjacent_bombs = count
  end

  def adjacent_locations_arr(pos)
    row, col = pos
    arr =
    [
      [row - 1, col - 1],
      [row, col - 1],
      [row + 1, col - 1],
      [row - 1, col],
      [row + 1, col],
      [row - 1, col + 1],
      [row, col + 1],
      [row + 1, col + 1],
    ]
    arr.select do |loc|
      loc.all? { |coord| (0..8).include?(coord) }
    end
  end

  def cardinal_locations_arr(pos)
    row, col = pos
    arr =
    [
      [row, col - 1],
      [row - 1, col],
      [row + 1, col],
      [row, col + 1]
    ]
    arr.select do |loc|
      loc.all? { |coord| (0..8).include?(coord) }
    end
  end

  def explosion(pos)
    self[pos].reveal

    adjacent_cells = cardinal_locations_arr(pos)
    return nil unless self[pos].adjacent_bombs == 0
    return nil if self[pos].has_bomb
    # return nil if adjacent_cells.all? { |cell| self[cell].adjacent_bombs > 0 || self[cell].revealed }

    explodable_cells = adjacent_cells.select do |loc|
      !self[loc].has_bomb && !self[loc].revealed
    end

    explodable_cells.each do |cellpos|
      explosion(cellpos)
    end
  end
end
