class Being
  @@count = 0

  def initialize
    @@count += 1
    puts "Being class created"
  end

  def show_count
    "There are #{@@count} beings"
  end
end

class Human < Being
  def initialize
    super
    puts "Human is created"
  end
end

class Animal < Being
  def initialize
    super
    puts "Animal is created"
  end
end

class Dog < Animal
  def initialize
    super
    puts "Dog is created"
  end
end

Human.new
d = Dog.new
puts d.send :show_count
