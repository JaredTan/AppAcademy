require 'rspec'
require 'hand'

describe Hand do
  card = [
    Card.new(:H, :two),
    Card.new(:H, :three),
    Card.new(:H, :four),
    Card.new(:H, :five),
    Card.new(:H, :six)
  ]
  subject(:hand) { Hand.new(card) }

  # describe "#initialize" do
  #   it "takes five random cards from the deck" do
  #     allow(deck).to receive(:cards).and_return([1,2,3,4,5,6])
  #     expect(hand.cards.length).to eq(5)
  #   end
  # end

    describe "correctly identifies highest hand in five cards" do

    end

    describe "correctly identifies all hands" do
      describe "#is_straight_flush?" do
        it "identifies straight flush" do

        end
      end

      describe "#is_four_of_a_kind?" do
        it "identifies four of a kind hand" do


        end
      end

      describe "#is_full_house?" do
        it "identifies a full house hand" do

        end
      end

      describe "#is_flush?" do
        it "identifies a flush" do

        end
      end

      describe "#is_straight?" do
        it "identifies a straight" do

        end
      end

      describe "#is_three_of_a_kind?" do
        it "identifies a three of a kind" do

        end
      end

      describe "#is_two_pair?" do
        it "identifies a two pair" do

        end
      end

      describe "#is_pair?" do
        it "identifies a pair" do

        end
      end

    end
end
