def navtive(arr,window)
current_max = 0
  (0..arr.length - window).each do |start|
    sub_array = arr[start, window]
    min = sub_array.min
    max = sub_array.max
    max_range = max - min
    current_max = max_range if max_range > current_max
  end
    current_max


end
#470

def queues(arr,window)

  current_max = 0
  queue = arr[0,window]
  (0..arr.length - window).each do |i|
    min = queue.min
    max = queue.max
    max_range = max - min
    current_max = max_range if max_range > current_max
    queue.shift
    queue << arr[window + i]
  end
  current_max
end

 
# arr = [*(1..69)]
#q 537
