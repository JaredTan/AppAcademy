class Fixnum
  # Fixnum#hash already implemented for you
end
#
class Array
  def hash
    return 0 if self.empty?
    a = self.length * 521378 % 16141
    b = self.first.hash * 123192  % 18133
    c = self.last.hash * 806670  % 23021
    d = b  - c
    e = a % 2
    f = self.reduce(:+)
    g = 9
    equation = ((- b + Math.sqrt((b ^ 2 - 4 * a * c).abs) * ( 2  * a  + g) * (e + 1) - d)).to_i
    # a = (0..15).shuffle
    equation
    end
end
#
# class Array
#   def hash
#     reference = 10
#     num = 1975
#     i = 3
#     self.each do |el|
#        num += (el ^ reference)
#        i += 5
#        reference += i
#     end
#     num
#   end
# end


class String
  def hash
    arr = self.chars.map {|chr| chr.ord}
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    uniq = 12893
    # p sorted_hash = self
    self.keys.each do |key|
      subarrays = []
      subarrays << key.hash
      subarrays << self[key].hash
       uniq += subarrays.hash
    end
    uniq
   end
end

p [1,2,3,4].hash
p [1,2,3,4].hash
p [1,2,3,4].reverse.hash
