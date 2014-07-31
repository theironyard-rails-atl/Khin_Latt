def lettercounter(input)
  countinghash = Hash.new
  letterarray = input.downcase.chars
  num = letterarray.length
  # i = 0
  # count = 0
  # letter = ""

  letterarray.each do |letter|
    if countinghash[letter]
      countinghash[letter] += 1
    else
      countinghash[letter] = 1
    end
  end
  
  countinghash

  # while(i < num)
  #   letter = letterarray[i]
  #   if(i == 0)
  #     countinghash[letter] = count + 1
  #   elsif(countinghash.has_key?(letter))
  #     countinghash[letter] += 1
  #   else
  #     countinghash[letter] = count + 1
  #   end
  #   i += 1
  # end
  # return countinghash
end



print "Write a string: "
input = gets.chomp.to_s
hash = lettercounter(input)
puts hash
if(hash.has_key?("t"))
  puts "There are #{hash["t"]} t's."
else
  puts "There is no t."
end
