class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[1,2,3], [], []]
  end

  def move(array)

    if valid_move(array)
      disc_from_tower = @towers[array[0]].shift
      @towers[array[1]].unshift(disc_from_tower)
    else
      raise "You can't move this disc!"
    end

  end

  def valid_move(array)
    from_tower = @towers[array[0]]
    to_tower = @towers[array[1]]
    return false if from_tower.empty?
    to_tower.empty? || to_tower.first > from_tower.first
  end

  def won?
    @towers[1] == [1, 2, 3] || @towers[2] == [1, 2, 3]
  end

end
