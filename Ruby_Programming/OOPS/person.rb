class Person
  attr_reader :name
  def initialize name
    @name = name
  end

  # def get_name
  #   @name
  # end
end

p1 = Person.new("Jane")
p2 = Person.new("Beky")
p3 = Person.allocate

# puts p1.get_name
# puts p2.get_name
puts p1.name
puts p2.name
puts p1.send :name # another way of calling the getter method
puts p1
puts p2
puts p3

class Circle

    @@PI = 3.141592

    def initialize
        @radius = 0
    end

    def set_radius=(radius)
        @radius = radius
    end

    def area
        @radius * @radius * @@PI
    end

    def self.pi_val
      @@PI
    end

end

c = Circle.new
p c.set_radius= 5
puts Circle.pi_val
puts c.area
