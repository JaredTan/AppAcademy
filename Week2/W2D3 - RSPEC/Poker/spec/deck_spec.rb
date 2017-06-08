require 'rspec'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates 52 cards" do
      expect(deck.cards.count).to eq(52)
    end

    it "initializes deck with only 4 suits" do
      suits = []
      deck.cards.each do |card|
        suits << card.suit unless suits.include?(card.suit)
      end
      expect(suits.count).to eq(4)
    end

    it "initializes each suit set with 13 cards of diff values" do
      hearts = deck.cards.select { |card| card.suit == :H }
      uniq_cards = []
      hearts.each do |card|
        uniq_cards << card.value unless uniq_cards.include?(card)
      end
      expect(uniq_cards.count).to eq(13)
    end

    it "allows each suit to have 13 possible cards" do
      hearts = deck.cards.select { |card| card.suit == :H }
      expect(hearts.length).to eq(13)
    end
  end

  describe "#shuffle!" do
    it "shuffles the deck randomly" do
      original_cards = deck.cards.dup
      deck.cards.shuffle!
      expect(original_cards).not_to eq(deck.cards)
    end
  end
end
