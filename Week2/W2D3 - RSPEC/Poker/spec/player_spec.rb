require 'rspec'
require 'player'

describe Player do

  let(:card1) { double("card", suit: :H, value: "2") }
  let(:card2) { double("card", suit: :H, value: "3") }
  let(:card3) { double("card", suit: :H, value: "4") }
  let(:card4) { double("card", suit: :H, value: "5") }
  let(:card5) { double("card", suit: :H, value: "6") }

  let(:hand) { double("hand", :cards => [card1, card2, card3, card4, card5]) }
  subject(:evelyn) { Player.new('Evelyn')}

  describe "#initialize" do
    it "initializes with a empty hand" do
      expect(evelyn.hand.length).to eq(0)
    end

    it "initializes with a player pot" do
      expect(evelyn.pot).to eq(0)
    end

    it "sets player to active" do
      expect(evelyn.folded).to be false
    end
  end

  describe "#discard" do
    it "removes up to 3 cards" do
      # evelyn.hand.cards = [
      #   Card.new(:H, :two),
      #   Card.new(:H, :three),
      #   Card.new(:H, :four),
      #   Card.new(:H, :five),
      #   Card.new(:H, :six)
      # ]

      expect(evelyn.discard([2, 4], hand)).to eq([hand.cards[0]] + [hand.cards[1]] + [hand.cards[3]])
    end

  end

  describe "#fold" do
    it "takes player out of game" do
      evelyn.fold
      expect(evelyn.folded).to be true
    end
  end

  describe "#see" do
    it "matches current bet" do
      evelyn.see(50)
      expect(evelyn.pot).to eq(50)
    end
  end

  describe "#raise_bet" do
    it "raises bet amount and increases pot" do
      evelyn.raise_bet(100)
      expect(evelyn.pot).to eq(100)
    end
  end
end
