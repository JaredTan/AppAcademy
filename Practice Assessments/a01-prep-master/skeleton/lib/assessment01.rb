require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    i = 0
      if accumulator.nil?
        accumulator = self.first
        i += 1
      end

      until i > self.length - 1
        accumulator = yield(accumulator, self[i])
        i += 1
      end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2..num / 2).each do |n|
    return false if num % n == 0
  end
  true
end

def primes(num)
  i = 2
  num_arr = []
  until num_arr.length == num
    num_arr << i if is_prime?(i)
    i += 1
  end
  num_arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  if num <= 1
    [1]
  else
    fac = factorials_rec(num - 1)
    fac << fac.last * (num - 1)
    fac
  end
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    counter_hash = Hash.new(0)
    self.each { |el| counter_hash[el] += 1 }
    selected_pairs = counter_hash.select { |_, v| v > 1 }
    selected_keys = selected_pairs.keys
    final_hash = {}
    selected_keys.each do |key|
      sub_arr = []
      self.each_with_index do |el, idx|
        sub_arr << idx if key == el
      end
      final_hash[key] = sub_arr
    end
    final_hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sym_arr = []
    (0..self.length - 1).each do |start|
      (2..self.length - start).each do |length|
        sym_arr << self[start, length] if self[start, length] == self[start, length].reverse
      end
    end
    sym_arr
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1
    half_point = self.length / 2
    sorted_left = self.take(half_point).merge_sort(&prc)
    sorted_right = self.drop(half_point).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged_arr = []
    until left.empty? || right.empty?
      spaceship = prc.call(left, right, &prc)
      if spaceship == -1
        merged_arr << left.shift
      elsif spaceship == 0
        merged_arr << left.shift
      elsif spaceship == 1
        merged_arr << right.shift
      end
    end
    merged_arr.concat(left).concat(right)
  end
end
