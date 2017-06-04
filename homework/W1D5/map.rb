class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    @map << [key, value] unless @map.any? { |pair| pair[0] == key }
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject { |pair| pair[0] == key }
  end

  def show
    @map
  end

end
