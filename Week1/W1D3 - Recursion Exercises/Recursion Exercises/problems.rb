
def range(start, ending)
  return [] if ending <= start + 1
  range_length = ending - start - 1
  new_arr = [start + 1]
  range_length.times do |idx|
    new_arr << range(start + 1, ending)[idx] unless idx == range_length - 1
  end
  new_arr
end

def range(min, max)
  arr = []
  ((min + 1)...max).each do |num|
    arr << num
  end
  arr
end

range(3, 10)

def exp(b, n)
  return 1 if n <= 0
  b * exp(b, n - 1)

end

def exp2(b, n)
  return 1 if n <= 0
  return b if n == 1

  if n.even?
    exp2(b, n / 2) * exp2(b, n / 2)
  else
    b * exp2(b, (n - 1) / 2) * exp2(b, (n - 1) / 2)
  end
end

def deep_dup(arr)
  new_arr = []
  arr.each do |el|
    if el.is_a?(Array)
      new_arr << deep_dup(el)
    else
      new_arr << el
    end
  end
  new_arr
end

def fib_seq(int)
  seq = [0, 1]
  idx = 1

  until idx == int - 1
    seq << seq[idx] + seq[idx - 1]
    idx += 1
  end

  seq
end

def fibs_rec(n)
  if n <= 2
    return [0, 1].take(n)
  else
    fibs = fibs_rec(n - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end

def fib_seq2(int)
  seq = [0, 1]
  return [0, 1] if int == 1
  prev_seq = fib_seq2(int - 1)

  (2...int).each do |i|
    seq << prev_seq[i - 2] + prev_seq[i - 1]
  end

  seq
end
#
class Array
  def subsets
    return [[]] if empty?
    subs = self.take(self.count - 1).subsets
    p subs
    subs + (subs.map { |sub| sub + [self.last] })
  end
end


#
def subsets2(array)
  return [[]] if array.empty?
  subs = subsets2(array.take(array.count - 1))
  p "#{subs} subs2"
  subs + (subs.map { |sub| p (sub + [array.last] ) })
end
# #
def subsets(array)
  return [[]] if array.empty?
  subs = subsets(array[0..-2])
  # sub_array = []
  # p subs
  changed_subs = subs.map do |sub|
    sub + [array[-1]]
  end
  subs + changed_subs
end



def subsets(array)
  return [[]] if array.empty?
  subs = subsets(array[0..-2])
  sub_array = []
  # sub_array = []
  # p subs
  subs.each do |sub|
    # sub_array << sub + [array[-1]]
    sub2 = sub + [array[-1]]
    sub_array << sub2
  end
  subs + sub_array
end

# #
def permutations(array)

  return [[]] if array.empty?
  sub_array = []
  perms = permutations(array[0..-2])

  perms.each do |perm|
    (0..perm.length).each do |i|
      sub_array << perm[0...i] + [array.last] + perm[i..-1]
    end
  end
  sub_array
end


permutations([:f, 3, 'lol', 6, 3.0, 'hi', :s])
def permutations(array)
  return [[]] if array.empty?
  sub_array = []
  subs = permutations(array[0...-1])

  subs.each do |sub|
    lala = sub.unshift(array.last).dup
    array.length.times do
      sub_array << lala.unshift(lala.pop)
    end
  end
  sub_array
end
#



























def permutations(arr)
  return [[]] if arr.empty?
  sub_arr = []
  perms = permutations(arr[0...-1])

  perms.each do |perm|
    (0..perm.length).each do |el|
      sub_arr << perm[0...el] + [arr.last] + perm[el..-1]
    end
  end
  sub_arr
end

permutations([1,2,3])

def subset(arr)

  return [[]] if arr.empty?
  subsets = subset(arr[0...-1])

  changed_subs = subsets.map do |sub|
    sub + [arr.last]
  end
  subsets + changed_subs
end

subset([1,2,3])

  # def bsearch(nums, target)
#   # nil if not found; can't find anything in an empty array
#   return nil if nums.empty?
#
#   probe_index = nums.length / 2
#   case target <=> nums[probe_index]
#   when -1
#     # search in left
#     bsearch(nums.take(probe_index), target)
#   when 0
#     probe_index # found it!
#   when 1
#     # search in the right; don't forget that the right subarray starts
#     # at `probe_index + 1`, so we need to offset by that amount.
#     sub_answer = bsearch(nums.drop(probe_index + 1), target)
#     (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
#   end
#
#   # Note that the array size is always decreasing through each
#   # recursive call, so we'll either find the item, or eventually end
#   # up with an empty array.
# end
# #
# def bsearch(array, value)
#   return nil if array.empty?
#   half_index = array.length / 2
#   if array[half_index] > value
#     sub_array = array.take(half_index)
#     bsearch(sub_array, value)
#   elsif array[half_index] == value
#     half_index
#   else
#     sub_array = array.drop(half_index + 1)
#     sub_answer = bsearch(sub_array, value)
#     if sub_answer.nil?
#       nil
#     else
#       half_index + sub_answer + 1
#     end
#   end
# end
class Array
  def merge_sort
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array <<
        ((left.first < right.first) ? left.shift : right.shift)
    end

    merged_array + left + right
  end
end

[12,5,3,6,4,1,6,4].merge_sort

def merge_sort(arr)
  return arr if arr.length < 2
  half = arr.length / 2
  # left = arr[0..half]
  # right = arr[(half + 1)..-1]
  merged_left = merge_sort(arr.take(half))
  merged_right = merge_sort(arr.drop(half))
  merged_arr = []
  until merged_left.empty? || merged_right.empty?
    merged_arr <<
    ((merged_left.first < merged_right.first) ? merged_left.shift : merged_right.shift)
  end
  merged_arr + merged_left + merged_right
end



merge_sort([1,5,2,6,3,7,14])
