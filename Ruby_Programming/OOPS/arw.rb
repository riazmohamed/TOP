class Car
  attr_reader :name, :price
  attr_writer :name, :price

  def someth
    "#{name}: #{price}"
  end

  def to_s
    "#{name}: #{price}"
  end
end

c1 = Car.new
c2 = Car.new

c1.name = "Porche"
c1.price = 23500
c2.name = "Volkswagon"
c2.price = 9500

puts "The #{c1.name} costs #{c1.price}"

# the puts method automatically calls the to_s method on the caller
puts c1
puts c2
# hence the above expression outputs the return value of the to_s method in class definition
