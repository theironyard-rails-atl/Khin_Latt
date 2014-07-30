File.open('day1homework.rb','r') do |x|
  k=0
  array=[]
  while line = x.gets #takes in each line and keeps repeating until the last line
    array[k] = line #assigns each line to the array
    k += 1 #increments the index
  end
  puts array.sample
end
