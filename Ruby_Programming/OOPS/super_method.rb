class Base
  def show(x=0, y=0)
    p "Base class, x: #{x}, y: #{y}"
  end
end

class Derived < Base
  def show(x, y)
    super # the value of the variable x and y are passed to the base class
    super(x) # the variable x only is passed to the base class
    super(x, y) # both the values of x and y are passed
    super() # no arguments are passed
  end
end

d = Derived.new
d.show(3, 3)
