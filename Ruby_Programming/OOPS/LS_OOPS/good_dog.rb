class GoodDog
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end

  def details
    puts "Name: #{name}, Age: #{age}."
  end
end

sparky = GoodDog.new('Sparky', 4)
fido = GoodDog.new('Fido', 6)
spot = GoodDog.new('Spot', 10)
sparky.name = 'Mr Cool'
sparky.details
fido.details
spot.details
