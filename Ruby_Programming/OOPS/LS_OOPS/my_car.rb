class MyCar
  attr_accessor :color
  attr_reader :year
  def initialize(year, model, color)
    @speed = 0
    @year = year
    @color = color
    @model = model
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

  def shut_off
    @speed = 0
    puts "The car has stopped!"
  end

  def spray_paint(color)
    self.color = color
    puts "The new paint on the car is #{self.color}"
  end
end

car = MyCar.new(2018, 'MAZDA 6', 'red')
car.speed_up(70)
car.brake(50)
car.current_speed
car.shut_off
puts car.color
car.color = "black"
puts car.color
puts car.year
puts "Enter the new colour"
puts ">....."
new_color = gets.chomp
car.spray_paint(new_color)
