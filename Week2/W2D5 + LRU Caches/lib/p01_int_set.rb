class MaxIntSet

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 1 || num > @store.count
    @store[num - 1] = true
  end

  def remove(num)
    @store[num - 1] = false
  end

  def include?(num)
    @store[num - 1]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_num = num % @store.length
    if @store[bucket_num].include?(num)
      nil
    else
      @store[bucket_num] << num
    end
  end

  def remove(num)
    bucket_num = num % @store.length
    @store[bucket_num].delete(num)
  end

  def include?(num)
    bucket_num = num % @store.length
    @store[bucket_num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @elements = []
  end

  def insert(num)
    resize! if @count >= num_buckets
    bucket_num = num % @store.length
    if include?(num)
      nil
    else
      @store[bucket_num] << num
      @elements << num
      @count += 1
    end
  end

  def remove(num)
    bucket_num = num % @store.length
    @store[bucket_num].delete(num)
  end

  def include?(num)
    bucket_num = num % @store.length
    @store[bucket_num].include?(num)
  end

  # private

  def [](num)
    num % num_buckets
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # if @count > @store.length
      # resize_times = @count

      @store = Array.new(@store.length * 2) { Array.new }
      @count = 0
      p num_buckets
      # num_buckets.times do
      #   @store << []
      @elements.each do |el|
        insert(el)
      end
      @elements = []
    # end
  end
end
