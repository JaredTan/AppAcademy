class Card

  attr_reader :suit, :value

  VALUES = %i(two three four five six seven eight nine ten jack queen king ace)

  # Values stored in a hash
  # VALUES = {two: "2", three: "3", four: "4", five: "5",
  #   six: "6", seven: "7", eight: "8", nine: "9", ten: "T",
  #   jack: "J", queen: "Q", king: "K", ace: "A" }

  SUITS = %i(H S C D)

  def initialize(suit, value)
    raise ArgumentError.new("Invalid value") if !VALUES.include?(value)
    @suit = suit
    @value = value
  end

  def self.create_deck
    SUITS.product(VALUES).map do |suit, value|
      Card.new(suit, value)
    end
  end

end
