#  My Each
class Array
  def my_each(&blk)
    idx = 0
    until idx > self.length - 1
      yield(self[idx])
      idx += 1
    end

    self
  end

  def my_select(&blk)
    new_arr = []
    self.my_each do |i|
      new_arr << i if yield(i)
    end
  end
end

  def my_reject(&blk)
    new_arr = []
    self.my_each do |i|
      new_arr << i unless yield(i)
    end
  end

  def my_any?(&blk)
    self.my_each do |i|
      return true if yield(i)
    end
    false
  end

  def my_all?(&blk)
    self.my_each do |i|
      return false unless yield(i)
    end
    true
  end

class Array
  def my_flatten
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr.concat(el.my_flatten) # new_arr += el.my_flatten
      else
        new_arr << el
      end
    end

    new_arr
  end

  def my_zip(*args)
    new_arr = []
    self.each_index do |idx|
      sub_arr = [self[idx]]

      args.each do |arg|
        sub_arr << arg[idx]
      end

      new_arr << sub_arr
    end

    new_arr
  end

  def my_rotate(num = 1)
    start_index = num % 4
    front = self[start_index..self.length - 1]
    back = self[0...start_index]
    front + back
  end

  def my_join(sep = "")
    new_str = ""
    self.each_with_index do |i, idx|
      new_str << i
      new_str << sep unless idx == self.length - 1
    end

    new_str
  end

  def my_reverse
    new_arr = []
    until self.length == 0
      last = self.pop
      new_arr << last
    end

    new_arr
  end
end

#

  #[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten
