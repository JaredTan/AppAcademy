class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
    aces = 0
    @cards.each do |card|
      if card.value == :ace
        sum += 11
        aces += 1
      else
        sum += card.blackjack_value
      end
    end
    if sum > 21
      aces.times do
        sum -= 10 if sum > 21
      end
    end
    sum
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted? && !busted?
    return true if points > other_hand.points
    false
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
