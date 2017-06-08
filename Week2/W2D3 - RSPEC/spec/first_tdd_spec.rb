require 'rspec'
require 'first_tdd'

describe Array do

  describe "#my_uniq" do

    it "removes duplicates from array" do
      my_array = [1, 2, 1, 3, 3]
      expect(my_array.my_uniq).to eq([1, 2, 3])
    end

    it "returns an empty array for array length 0" do
      my_array = []
      expect(my_array.my_uniq).to eq([])
    end

  end

  describe "#two_sum" do

    it "find pairs of positions where elements sum to zero" do
      my_array = [-1, 0, 2, -2, 1]
      expect(my_array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "swaps the rows and columns of an array" do
      my_array = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
      expect(my_array.my_transpose).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]])

    end
  end

  describe "#stock_picker" do
    it "returns the most profitable buy and sell days" do
      my_array = [500, 501, 788, 455, 599, 777]
      expect(my_array.stock_picker).to eq([3, 5])
    end
  end


end
