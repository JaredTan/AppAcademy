require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @elements = []
  end
  #ASSUME NUM = KEY
  def insert(num)
    p @count
    p 'count'
    p num_buckets
    p 'num_buckets'
    resize! if @count >= num_buckets
    bucket_num = num.hash % @store.length
    if include?(num)
      nil
    else
      @store[bucket_num] << num.hash
      @elements << num # original element
      @count += 1
    end
  end

  def remove(num)
    bucket_num = num.hash % @store.length
    @store[bucket_num].delete(num.hash)
  end

  def include?(num)
    bucket_num = num.hash % @store.length
    @store[bucket_num].include?(num.hash)
  end

  private

  # def [](num)
  #   num % num_buckets
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  def num_buckets
    @store.length
  end

  def resize!
    # if @count > @store.length
      # resize_times = @count
      p @store
      @store = Array.new(@store.length * 2) { Array.new }
      @count = 0
      # p num_buckets
      # num_buckets.times do
      #   @store << []
      p @elements
      p @store.length
      p @count
      p num_buckets
      @elements.each do |el|
        insert(el)
      end
      p @store

      @elements = []

  end

  set = HashSet.new(8)
  9.times { |i| set.insert(i) }
end
