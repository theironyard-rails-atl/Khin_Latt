#2-1
def grade(num)
  if(num >= 90)
    "A"
  elsif(num >= 80)
    "B"
  elsif(num >= 70)
    "C"
  elsif(num >= 60)
    "D"
  else
    "F"
  end
end

puts grade(90)

#2-2
def students(num)
  array = []
  num.times { array << rand(0..100) }
  puts "#{array}"
  return array
end

students(5)

#2-3
def how_many_A(array)
  count = 0
  array.each do |x|
    count += 1 if(grade(x) == "A")
  end
  puts "#{count} A('s)!"
  return count
end

how_many_A(students(25))
