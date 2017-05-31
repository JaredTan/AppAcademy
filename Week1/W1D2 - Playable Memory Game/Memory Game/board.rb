require_relative "card"

class Board

  attr_accessor :grid

  def initialize(dimensions)
    @grid = Array.new(dimensions[0]) { Array.new(dimensions[1]) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate(dimensions)
    number_of_cards = dimensions.reduce(:*) / 2
    number_of_cards.times do
      dupl_card = rand_card
      dupl_card2 = dupl_card.dup
      self[rand_dimensions(dimensions)] = dupl_card
      self[rand_dimensions(dimensions)] = dupl_card2
    end
  end

  def rand_dimensions(dimensions)
    rand_arr = [rand(dimensions[0]), rand(dimensions[1])]
    until self[rand_arr].nil?
      rand_arr = [rand(dimensions[0]), rand(dimensions[1])]
    end
    rand_arr
  end

  def rand_card
    card_list[rand(13)]
  end

  def card_list
    [
      Card.new(:'A'),
      Card.new(:'2'),
      Card.new(:'3'),
      Card.new(:'4'),
      Card.new(:'5'),
      Card.new(:'6'),
      Card.new(:'7'),
      Card.new(:'8'),
      Card.new(:'9'),
      Card.new(:'T'),
      Card.new(:'J'),
      Card.new(:'Q'),
      Card.new(:'K'),
    ]
  end

  def render
  display_grid = @grid.map do |row|
    row.map do |card|
      card.display_symbols
      card.display_symbol
    end
  end
  display_grid.map! { |line| line.join(' | ') }
  display_grid.join("\n#{"----" * (@grid[0].length - 1)}--\n")
  end


end
