class Averager
  def average(*nums)
    puts ((nums.inject(0){|sum,num| sum + num}).to_f)/(nums.length)
  end
end

Averager.new.average(1,2,3,4,5,6)
