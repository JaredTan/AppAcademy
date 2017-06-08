require 'rspec'
require 'card'

describe Card do

  subject(:card) { Card.new(:H, :seven) }

  describe "#initialize" do
    it "initializes with a suit" do
      expect(card.suit).to eq(:H)
    end

    it "initializes with a value" do
      expect(card.value).to eq(:seven)
    end

    it "throws error if card value is invalid" do
      expect { Card.new(:H, :Z) }.to raise_error(ArgumentError)
    end
  end

end
