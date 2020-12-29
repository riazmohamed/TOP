module Sleeping
  def sleep
    puts "#{self.class.name} is sleeping"
  end
end

class Animal
  def make_noise
    "Some noise"
  end

  include Sleeping
end

class Dog < Animal
  def make_noise
    "Woof!"
  end

  include Sleeping
end

class Cat < Animal
  def make_noise
    "Meow!"
  end

  include Sleeping
end

[Animal.new, Dog.new, Cat.new].each do |animal|
  puts animal.make_noise
  animal.sleep
end
