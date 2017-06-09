def my_min(list)
  list.each do |num|
      return num if list.all?{|num2| num2 >= num}
  end
end

def my_min2(list)
  max = last.first
  list.each do |num|
    max = num if num > max
  end
  max
end

def subsets(list)

  return [] if list.length == 0
  subs = subsets(list[0...-1])
  new_subs = subs.map { |el| el << list[-1] }
  subs.concat(new_subs)

end

def largest_contiguous_subsum(list)
  subs = subsets(list).drop(1)
  largest = subs.first.inject(:+)
  subs.each do |arr|
    largest = arr.inject(:+) if arr.inject(:+) > largest
  end
  largest
end

def phase_2(list)
  largest = list.inject(:+)
  list.each_index do |idx|
    (list.length).times do |idx2|
      next if list[idx, idx2].empty?
      next if idx2 < idx
      p list[idx, idx2]
      p largest
      largest = list[idx, idx2].inject(:+) if list[idx, idx2].inject(:+) > largest
    end
  end
  largest

end

list = [2, 3, -6, 7, -6, 7]
phase_2(list)
