class LRUCache

attr_reader :cache, :size

    def initialize(size)
      @cache = []
      @size = size
    end

    def count
      @cache.length # returns number of elements currently in cache
    end

    def add(el)
      if @cache.include?(el)
        @cache.delete(el)
        @cache << el
      elsif count >= size
        @cache.shift
        @cache << el
      else
        @cache << el # adds element to cache according to LRU principle
      end
    end 

    def show
      puts @cache # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

  end
