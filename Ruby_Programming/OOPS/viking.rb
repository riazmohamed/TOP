class Person
  MAX_HEALTH = 120

  def heal
    self.health += 1 unless self.health + 1 > MAX_HEALTH
  end
end

class Viking < Person
  attr_accessor :name, :health, :age, :strength

  def initialize(name, health, age, strength)
    @name = name
    @health = health
    @age = age
    @strength = strength
  end

  def self.create_warrior(name)
    age = rand * 20 + 5
    health = [age * 5, 200].min
    strength = [age / 2, 10].min
    Viking.new(name, health, age, strength)
  end

  def attack(enemy)
    # code to fight
  end

  def take_damage(damage)
    self.health -= damage # not calling self or @ , ruby will initiate a new local variable
    shout("OUCH!")
  end

  def shout(str)
    puts str
  end

  def self.random_name
    ["Erik", "Riaz", "Leif", "Lars"].sample
  end

  def self.silver_to_gold(silver_pieces)
    silver_pieces / 10
  end

  class << self
    def gold_to_silver(gold_pieces)
      gold_pieces * 10
    end
  end

  def heal
    2.times { super() }
    puts "Ready for Battle!"
  end
end

oleg = Viking.new("Oleg", 100, 19, 8)

p oleg.take_damage(3)
p sten = Viking.create_warrior("Sten")
p warrior1 = Viking.create_warrior(Viking.random_name)
p oleg.heal
p oleg.health
