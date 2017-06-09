def two_sum (array,target)
hash = Hash.new(0)#{|h,k| h[k] = true}

array.each do |el|
  hash[el] += 1
  dif =  target - el
  return
  return true if  hash[dif] > 0 && dif != el
  return true if  el != dif &&  hash[dif] > 1
end
  false

end
