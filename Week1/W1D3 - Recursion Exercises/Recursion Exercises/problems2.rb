def range(min, max)

  return [] if max < min + 1
  range(min, max - 1) << max - 1
end

def range(min, max)
  new_arr = []
  (min + 1...max).each do |num|
    new_arr << num
  end
  new_arr
end

def exp(b, n)
  return 1 if n == 0
  return b if n == 1
  exp(b, n - 1) * b
end

exp(2, 5)

def exp(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exp(b, n/2) * exp(b, n/2)
  else
    b * exp(b, (n-1) / 2) * exp(b, (n-1) / 2)
  end
end

exp(2, 5)

def deep_dup(arr)
  new_arr = []
  arr.each do |i|
    if i.is_a?(Array)
      new_arr << deep_dup(i)
    else
      new_arr << i
    end
  end
  new_arr
end

def fib_seq(n)
  return 'error' if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2
  fib_arr = fib_seq(n - 1)
  fib_arr << fib_arr[-2] + fib_arr[-1]
  fib_arr
end

def fib_seq(n)
  fib_arr = [1, 1]
  until fib_arr.length == n
    fib_arr << fib_arr[-2] + fib_arr[-1]
  end
  fib_arr
end

fib_seq(5)

def subsets(arr)
  return [[]] if arr.length == 0
  subs = subsets(arr[0...-1])
  changed_subs = subs.map do |sub|
    sub + [arr[-1]]
  end
  subs + changed_subs
end

def permutations(arr)
  return [[]] if arr.empty?
  perms = permutations(arr[0...-1])
  new_arr = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      new_arr << perm[0...i] + [arr.last] + perm[i..-1]
    end
  end
  new_arr

end

permutations([1,2,3,4,5])
subsets([1,2,3])
