class Student
  attr_writer :grade
  attr_accessor :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def get_grade
    self.grade
  end

  def better_grade_than?(other_student)
    grade > other_student.get_grade
  end

  private

  def grade
    @grade
  end
end

joe = Student.new("Joe", 95)
bob = Student.new("Bob", 80)

puts "Well Done!" if joe.better_grade_than?(bob)
