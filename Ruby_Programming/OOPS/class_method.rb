class Circle
  def initialize(x)
    @r = x
  end

  # methods starting with the self key words are known as class methods.
  def self.info # class method, can be called only on the class methods
    "This is a Circle class"
  end

  def area
    @r * @r * 3.141592
  end
end

p Circle.info
c = Circle.new(3)
p c.area
