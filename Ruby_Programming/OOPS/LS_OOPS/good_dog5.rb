class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end
  puts self
end

dog1 = GoodDog.new("Sparky", "12 inches", "40 lbs")
puts dog1.info

dog1.change_info("Ruby", "12 inches", "30 lbs")
puts dog1.info
puts dog1.what_is_self

p GoodDog
