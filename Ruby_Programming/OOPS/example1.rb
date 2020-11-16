# example1.rb

class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end

  def description
    puts "I am #{@name} and I was created by #{@creator}."
  end
end

ruby = Language.new("Ruby", "Some dude")
python = Language.new("Python", "Another dude")
javascript = Language.new("Javascript", "Some nerd")

ruby.description
python.description
javascript.description
