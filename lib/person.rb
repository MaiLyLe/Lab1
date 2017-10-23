
#ruby app

class UnknownAttributeError  < StandardError


#####################
end

class Person

  attr_accessor :name
  attr_accessor :hobbies


def initialize(attribute_hash = nil)
  if (attribute_hash!= nil)
    attribute_hash.each {|k,v| instance_variable_set("@#{k}",v)}


    @hobbies = @hobbies.split(",")

    if(attribute_hash.length>2)
	    raise UnknownAttributeError.new("There is no attribute called #{attribute_hash.keys[2]}")
    end

  end
  def self.friendslist(persons)
  end
end

def hobbies=(hobbies)
@hobbies = hobbies.split(",")

puts @hobbies

end


def commonHobbies(person)


intersection = @hobbies & person.hobbies

return intersection

end


def self.friendslist(members)

  friendlistArray = Array.new

  memberPairs = Array(0..members.length-1)
  memberPairs = memberPairs.combination(2).to_a


  for i in 0...memberPairs.length

        indexPair = memberPairs[i]

        indexA = indexPair[0]
        indexB = indexPair[1]



        personA = members[indexA]
        personB = members[indexB]


        hobbiesA = personA.hobbies
        hobbiesB = personB.hobbies

        shared = hobbiesA & hobbiesB


        if(shared.length>0)
        arrayInsideList = Array.new

        arrayInsideList.push(shared.length)

        hobbiesString =""

        for i in 0...shared.length
          hobbiesString << shared[i]
          hobbiesString << ", "
        end

        hobbiesString = hobbiesString[0...-2]

        arrayInsideList.push(hobbiesString)

        arrayInsideList.push(personA.name)
        arrayInsideList.push(personB.name)

          friendlistArray.push(arrayInsideList)
      end
end

friendlistArray = friendlistArray.sort_by{|k|k[0]}.reverse

return friendlistArray

end


end




p1 = Person.new(name: "Hans",hobbies: "Diving")
p2 = Person.new(name: "Dagobert1",hobbies: "Money,Bathing,Knitting")
p3 = Person.new(name: "Dagobert2",hobbies: "Money,Bathing")
p4 = Person.new(name: "Donald",hobbies: "Bathing")


array = [p1,p2,p3,p4]
result = Person.friendslist(array)


puts result
