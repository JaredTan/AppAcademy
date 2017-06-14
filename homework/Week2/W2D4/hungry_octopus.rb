# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']÷
def sluggish_octopus(array)
  #O(N^2)
  prc ||= proc { |x, y| x <=> y }
  sorted = false
  until sorted
    sorted = true

    each_index do |i|
      j = i + 1
      next if i == array.length - 1
      if array[i] > array[j]
        sorted = false
        self[i], self[j] = self[j], self[i]
      end
    end
  end
  array.last
end

def dominant_octupus(array, &prc)
  #O(nlog(n))
  prc ||= proc { |x, y| x <=> y }
  return array if array.length < 2
  half = array.length / 2
  sorted_left = array.take(half).merge_sort(&prc)
  sorted_right = array.take(half).merge_sort(&prc)

  merge(sorted_left, sorted_right, &prc)
end

def merge(left, right, &prc)
  merged_arr = []
  until left.empty? || right.empty?
    spaceship = prc.call(left.first, right.first)
    if spaceship == -1 || spaceship == 0
      merged_arr << left.shift
    else
      merged_arr << right.shift
    end
  end
  merged_arr.concat(left).concat(right)
end

def clever_octopus(array)
  longest_fish  = fish[0]
  fish.each_index do |idx|
    longest_fish = fish[idx] if fish[idx].length > longest_fish.length
  end
  longest_fish
end

def slow_dance(pos, array)
array.each_with_index do |pos2, idx|
  return idx if pos2 == pos
end

def fast_dance(pos, array)
  move_hash = {
    up: 0,
    up_right: 1,
    right: 2,
    right_down: 3,
    down: 4,
    left_down: 5,
    left: 6,
    left_up: 7
  }
  move_hash[pos]
end
