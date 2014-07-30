def printOut(name,age)
  puts "My name is #{name} and I am #{age} years old."
end

@person = Hash.new #creates new hash {}

def addHash(name,age)
  @person[name.to_sym] = age #converts to symbol for the key
  puts @person
end



printOut("Khin",22) #calls printOut method, passing string and integer
addHash(:Khin,22)
addHash("Tom",24)
addHash(:TwoPeople,[25,26]) #adds array to the Hash
