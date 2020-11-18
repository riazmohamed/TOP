class GoodDog
  @@number_of_dogs = 0 # class variable

  def initialize # gets initialized when we call a new object (the constructor method)
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs # class method
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs
