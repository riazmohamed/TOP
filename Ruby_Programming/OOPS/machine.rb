class Machine
  @@users = {}

  def initialize(user, password)
    @username = user
    @password = password
    @@users[@username] = @password
    @files = {}
  end

  def created(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end

  def self.get_users
    @@users
  end
end

my_machine = Machine.new("Riaz", 12345)
your_machine = Machine.new("Zair", 431123)
my_machine.created("groceries.txt")
your_machine.created("to_do.txt")
puts "The list of users are: #{Machine.get_users}"
