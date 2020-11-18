module Speedable
  def turn_off(vehicle)
    "The #{vehicle} has stopped!"
  end
end

class Vehicle
  include Speedable

  attr_accessor :color
  attr_reader :year

  @@number_of_times_vehicle_initiated = 0

  def initialize(year, model, color)
    @speed = 0
    @year = year
    @color = color
    @model = model
    @@number_of_times_vehicle_initiated += 1
  end

  def speed_up(number)
    @speed += number
    puts "The current speed of the car is #{@speed}"
  end

  def brake(number)
    @speed -= number
    puts "The current speed of the car is #{@speed}"
  end

  def current_speed
    puts "The current speed of the car is #{@speed}"
  end

  def spray_paint(color)
    self.color = color
    puts "The new paint on the car is #{self.color}"
  end

  def self.calulate_milleage(gallons, miles)
    puts "Total Mileage: #{miles/gallons} per gallon "
  end

  def self.class_initiation_count
    puts "This program has created #{@@number_of_times_vehicle_initiated} vehicles."
  end

  def how_old
    "The vehicle is #{self.age} years old."
  end

  private
  def age
    @age_difference = Time.now.year - self.year
  end
end

class MyCar < Vehicle
  VEHICLE_TYPE = "Car"

  def vehicle_type
    VEHICLE_TYPE
  end

  def shut_off
    @speed = 0
    turn_off(VEHICLE_TYPE)
  end
end

class MyTruck < Vehicle
  VEHICLE_TYPE = "Truck"

  def vehicle_type
    VEHICLE_TYPE
  end

  def shut_off
    @speed = 0
    turn_off(VEHICLE_TYPE)
  end

end

puts "---Car details---"
car = MyCar.new(2018, 'MAZDA 6', 'red')
car.speed_up(70)
car.brake(50)
car.current_speed
puts car.shut_off
puts car.color
car.color = "black"
puts car.color
puts car.year
new_color = "blue"
car.spray_paint(new_color)
MyCar.calulate_milleage(13, 400)
p car.vehicle_type
puts car.how_old

puts ""
puts "---Truck details---"
truck = MyTruck.new(2019, 'VW', 'white')
truck.speed_up(70)
truck.brake(50)
truck.current_speed
puts truck.shut_off
puts truck.color
truck.color = "black"
puts truck.color
puts truck.year
new_color = "Red"
truck.spray_paint(new_color)
MyTruck.calulate_milleage(20, 400)
p truck.vehicle_type

Vehicle.class_initiation_count
puts ""
puts "Car Method Look Up Path"
puts ""
puts MyCar.ancestors
puts ""
puts "Truck Method Look Up Path"
puts ""
puts MyTruck.ancestors
puts truck.how_old
