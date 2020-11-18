class Parent
  def say_hi
    p "Hi from parent."
  end
end

class Child < Parent
  def say_hi
    p "Hi from Child."
  end
end

child = Child.new
child.say_hi

son = Child.new
son.send :say_hi

c = Child.new
 p c.instance_of? Child
