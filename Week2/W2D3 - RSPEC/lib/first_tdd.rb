class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    pair = []
    (0...self.length - 1).each do |idx1|
      (idx1 + 1...self.length).each do |idx2|
        pair << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    pair
  end

  def my_transpose
    new_arr = []

    self.each_index do |idx1|
      sub_arr = []
      (0...self.length).each do |idx2|
        sub_arr << self[idx2][idx1]
      end
      new_arr << sub_arr
    end

    new_arr
  end

  def stock_picker
    return [] if self.length < 2
    current_profit = self[1] - self[0]
    results_pair = [0, 1]
    self.each_index do |idx1|
      (idx1 + 1...self.length).each do |idx2|
        current_profit = self[results_pair[1]] - self[results_pair[0]]
        if self[idx2] - self[idx1] > current_profit
          results_pair = [idx1, idx2]
        end
      end
    end
    results_pair
  end


end
