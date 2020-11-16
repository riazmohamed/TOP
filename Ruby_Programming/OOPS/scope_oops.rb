class Computer
  $manufacturer = "Mango Mama Inc"
  @@files = {hello: "You are the man?"}

  def initialize(name, password)
    @current_user = name
    @current_password = password
  end

  def self.display_files
    @@files
  end

  def current_user
    @current_user
  end

  def current_password
    @password
  end
end

hal = Computer.new("Riaz", 123445)
puts "Current User: #{hal.current_user}"
puts "Current Password: #{hal.current_password}"
puts "Manufacturer: #{$manufacturer}"
puts "Files: #{Computer.display_files}"
