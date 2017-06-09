require 'lru_cache'

describe LRUCache do
  subject(:cache) do
    LRUCache.new(4)
  end

  describe "#initialize" do
    it "initializes with an empty array" do
    expect(cache.cache).to eq([])
  end

end

  describe "#add" do
    it "adds an element to the cache" do
      cache.add('hello')
      expect(cache.cache). to eq(['hello'])
    end

    it "pushes an element off the cache if too long"

    it "deletes and puts in the back of the cache if the element is in the array"

  end

  describe "#count" do
    it "counts the number of elements in the cache"

  end

  describe "show" do
    it "prints the cache"
  end
end
