require_relative 'card'

# Represents a deck of playing cards.
class Deck
  SUITS = []
  # Returns an array of all 52 playing cards.
  def self.all_cards
    new_arr = []
      Card.suits.each do |suit|
      Card.values.each do |value|
        new_arr << Card.new(suit, value)
      end
    end
    new_arr
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if @cards.length < n
    @cards.shift(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards += cards.flatten
  end

end
