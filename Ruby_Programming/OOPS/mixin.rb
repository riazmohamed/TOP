module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped #{@distance} feet forward!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
p peter.name
jiminy.jump
p jiminy.name
