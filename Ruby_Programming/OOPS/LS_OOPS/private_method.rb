class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def public_disclosure
    "#{name} in human years is #{human_years} years old."
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new('Sparky', 4)
p sparky.public_disclosure
