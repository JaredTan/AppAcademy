require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do

  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    it "creates basic setup for game" do
      expect(game.towers.length).to eql(3)
    end
    it "fills the first tower with 3 disks" do
      expect(game.towers[0]).to eql([1, 2, 3])
    end
  end

  describe "#move" do
    it "moves a disk to a different tower if valid move" do
      game.move([0, 1])
      expect(game.towers[1]).to eql([1])
    end

    it "raises error if not valid move" do
      game.move([0, 1])
      expect { game.move([0, 1])}.to raise_error(StandardError)
    end

  end

  describe "#won?" do
    it "returns true if all disks moved to another pile" do
      game.move([0, 1])
      game.move([0, 2])
      game.move([1, 2])
      game.move([0, 1])
      game.move([2, 0])
      game.move([2, 1])
      game.move([0, 1])
      expect(game.won?).to be true
    end

    it "returns false if not all disks moved to another pile" do
      game.move([0, 1])
      game.move([0, 2])
      game.move([1, 2])
      expect(game.won?).to be false
    end

    it "returns false when no moves have been made" do
      expect(game.won?).to be false
    end

    it "returns false if only the first tower is filled" do
      game.move([0, 1])
      game.move([1, 0])
      expect(game.won?).to be false
    end

  end


end
