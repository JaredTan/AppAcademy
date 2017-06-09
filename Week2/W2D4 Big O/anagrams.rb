

def permutations2(arg1, arg2)
  chopped1 = arg1.chars.sort
  chopped2 = arg2.chars.sort

  chopped1.each_with_index do |let1, idx1|
    if chopped1[idx1] == chopped2[idx]
      chopped1[idx1] = ''
      chopped2[idx1] = ''
    end
  end

  chopped1.delete('')
  chopped2.delete('')

  chopped1.empty? || chopped2.empty?  

end



def permutations(arg1, arg2)
  arg1 = first_anagram?(arg1.chars)
  arg1.include?(arg2.chars)

end


def first_anagram?(set)

return [set] if set.length < 2

per = first_anagram?(set.drop(1))

new_perms = []
  per.each do |el|
    (el.length+1).times do |i|
      new_perms << el[0...i] + [set.first] + el[i..-1]
    end
  end
new_perms
end
