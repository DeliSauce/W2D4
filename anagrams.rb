require 'byebug'

# n + n! + n  -> O(n!)
def first_anagram?(str1, str2)
  subsets = str1.chars.permutation.to_a.map {|subset| subset.join("")}
  subsets.include?(str2)
end

#O(n^2)
def second_anagram?(str1, str2)
  str1.chars.each_with_index do |letter_one, index_one|
    str2.chars.each_with_index do |letter_two, index_two|
      if letter_one == letter_two
        str1.slice!(0)
        str2.slice!(index_two)
        break
      end
    end
  end
  str1.empty? && str2.empty?
end

# n + nlogn  -> O(nlogn)
def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

# n + n  -> O(n)
def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.chars.each do |char|
    hash1[char] += 1
  end

  str2.chars.each do |char|
    hash2[char] += 1
  end

  hash1 == hash2

end




def fifth_anagram?(str1, str2)
  hash = Hash.new(0)
  
  str1.chars.each do |char|
    hash[char] += 1
  end

  str2.chars.each do |char|
    hash[char] -= 1
  end

  hash.all?{|k,v| v == 0}
end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true
