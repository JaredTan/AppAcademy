require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)

  end

  def set(key, val)
     #location
    # new_link = Link.new(key, val)

    @store[bucket_num(key)].update(key, val)
        p @store[bucket_num(key)]
  end

  def get(key)
    @store[bucket_num(key)].get(key)
  end

  def delete(key)
  end

  def each
  end

  def bucket_num(key)
    key.hash % @store.length
  end
  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end

a = HashMap.new
a.set(:first, 1)
