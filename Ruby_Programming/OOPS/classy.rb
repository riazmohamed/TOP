class Person
  @@people_count = 0

  def initialize(name)
    @name = name
    @@people_count += 1
  end

  def self.people_count
    @@people_count
  end
end

matz = Person.new('Yukihiro')
dhh = Person.new('David')
ranm = Person.new('Riaz')

puts "The total number of people = #{Person.people_count}"
