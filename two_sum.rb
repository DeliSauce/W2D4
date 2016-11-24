require 'byebug'

def bad_two_sum?(array, target)
  (0...array.size - 1).each do |start_num|
    (start_num + 1..array.size - 1).each do |end_num|
      return true if array[start_num] + array[end_num] == target
    end
  end

  false
end

def okay_two_sum?(array, target)
  mid_val = target/2
  left_arr = []
  right_arr = []

  array.sort!

  array.each_with_index do |num, idx|
    if mid_val <= num
      p left_arr = array.take(idx)
      p right_arr = array.drop(idx)
      break
    end
  end

  lower = left_arr.pop
  higher = right_arr.shift
  while true
    sum = lower + higher
    # debugger
    if sum == target
      return true
    elsif sum < target
      break if right_arr.empty?
      higher = right_arr.shift
    elsif sum > target
      break if left_arr.empty?
      lower = left_arr.pop
    end
  end

  false
end

arr = [-1, 3, 5, 7, 10, 11, 12]
p okay_two_sum?(arr, 5) # => should be true
p okay_two_sum?(arr, 8) # => should be false
