#1)
def hypotenuse(a,b)
  Math.sqrt(a*a + b*b)
end

puts hypotenuse(3,4)

#2)
#You can append strings using +; also, strings can be converted to integers and
#floats which symbols cannot do (to_i, to_f).

#3)
#Fixnum class holds integers which are defined basic objects. It is not like
#a group of basic objects so Fixnum.new would not make sense. Therefore, it is
#not defined by default.

#4)
class Musher
  def initialize symbol
    @symbol = symbol
  end
  def mush array
    puts "#{array[0]} #{@symbol} #{array[1]} #{@symbol} #{array[2]} "
  end
end

Musher.new("+").mush(["array","of","strings"])

#5)
class Averager
  def average(*nums)
    puts ((nums.inject(0){|sum,num| sum + num}).to_f)/(nums.length)
  end
end

Averager.new.average(1,2,3,4,5,6)

#6)
File.open('day1text.rb','r') do |x|
  k=0
  array=[]
  while line = x.gets #takes in each line and keeps repeating until the last line
    array[k] = line #assigns each line to the array
    k += 1 #increments the index
  end
  puts array.sample
end

# day1text.rb files contains:
# Hi
# This is a program testing reading and writing
# Is this correct?
# Perhaps
# Awesome
