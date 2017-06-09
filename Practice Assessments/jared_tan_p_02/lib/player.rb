class Player
  attr_reader :name, :bankroll
  attr_accessor :hand

  def initialize(name, bankroll = 0)
    @name = name
    @bankroll = bankroll
  end

  def pay_winnings(bet_amt)
    @bankroll += bet_amt
  end

  def return_cards(deck)
    @hand.return_cards(deck)
    @hand = nil
  end

  def place_bet(dealer, bet_amt)
    raise "Dealer doesn't bet" if self.class == Dealer
    raise "player can't cover bet" if bet_amt > @bankroll
    dealer.take_bet(self, bet_amt)
    @bankroll -= bet_amt
  end
end
