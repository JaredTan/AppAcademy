require_relative 'hand'

class Player

attr_accessor :hand, :name, :pot, :folded

  def initialize(name)
    @name = name
    @hand = []
    @pot = 0
    @folded = false
  end

  def discard(arr, hand)
    new_arr = []
    ok_indices = (0..4).to_a - arr
    ok_indices.each do |idx|
      new_arr << hand.cards[idx]
    end
    new_arr
  end

  def fold
    @folded = true
  end

  def see(bet)
    @pot += bet
  end

  def raise_bet(bet)
    @pot += bet
  end

end
