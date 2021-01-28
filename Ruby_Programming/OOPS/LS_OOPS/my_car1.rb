module VehicleDetails
    def show
      "#{model} was made in #{year}, is #{color} in color. It is travelling at a speed of #{current_speed} kms"
    end

# how_old is a method initialized in the Vehicle class.
    def details(vehicle_type)
      "Your #{vehicle_type} is #{model} is #{color} colour and it is a #{year} model and is #{how_old} years old."
    end
end

class Vehicle
  attr_accessor :current_speed, :color
  attr_reader :year, :model

  @@number_of_vehicle = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicle += 1
  end

  def self.gas_mileage(miles_driven, gallons_used)
    mileage = miles_driven / gallons_used
    puts "The gas mileage of your vehicle is #{mileage} mpg"
  end

  def speed_up(number)
    self.current_speed += number
  end

  def brake(number)
    self.current_speed -= number
  end

  def shut_off
    self.current_speed = 0
  end

  def spray_paint=(paint)
    self.color = paint
    puts "Now the color of the vehicle is #{self.color}"
  end

  def self.total_vehicles
    @@number_of_vehicle
  end

  def how_old
    age(year)
  end

  private
  # beginning of private methods
  def age(manufacture_date)
    Time.now.year - manufacture_date
  end
  # end of private methods
end

class MyCar < Vehicle
  CAR_TYPE = "Car"
  include VehicleDetails

  def car_info
    details(CAR_TYPE)
  end
end

class MyTruck < Vehicle
  TRUCK_TYPE = "Truck"
  include VehicleDetails

  def truck_info
    details(TRUCK_TYPE)
  end
end

car = MyCar.new(2000, "blue", "Alto")
truck = MyTruck.new(1996, "White", "Mercedes")
p truck
puts car.show
car.speed_up(50)
puts car.show
car.speed_up(50)
puts car.show
car.brake(50)
puts car.show
car.shut_off
puts car.show
puts car.model
puts car.color
puts car.year
car.spray_paint = "red"

MyCar.gas_mileage(300, 6)
puts car.car_info
puts truck.truck_info
puts "Total number of vehicles are: #{Vehicle.total_vehicles}"

puts "\t\v============= My Car =============="
puts MyCar.ancestors
puts "\v\t============= My Truck =============="
puts MyTruck.ancestors
puts "\v\t============= Vehicle =============="
puts Vehicle.ancestors
