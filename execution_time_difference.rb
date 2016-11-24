def my_min_one(list)
  (0...list.size - 1).each do |i|
    return list[i] if (i + 1...list.size).all? { |j| list[i] < list[j] }
  end
end

def my_min_two(list)
  min = list[0]
  list.each do |el|
    min = el if el < min
  end

  min
end

def largest_contiguous_subsum_one(list)
  subsets = []
  (0...list.size - 1).each do |start_num|
    (start_num...list.size - 1).each do |end_num|
      subsets << list[start_num..end_num]
    end
  end

  max_sum = nil
  subsets.each do |subset|
    current_sum = subset.inject(:+)
    if max_sum.nil?
      max_sum = current_sum
    else
      max_sum = current_sum if max_sum < current_sum
    end
  end
  max_sum
end

def largest_contiguous_subsum_two(list)
  largest = list.first
  current = list.first

  return list.max if list.all? {|num| num < 0}

  list.drop(1).each do |num|
    current = 0 if current < 0
    current += num

    largest = current if current > largest
  end
  largest
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_two(list)
