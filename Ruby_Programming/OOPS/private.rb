class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  public # this method can be called from outside of the class
  def about_me
    puts "I am #{@name} and I am #{@age} years old."
  end

  private # this method can't be called from outside of the class
  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}"
  end
end

riaz = Person.new("riaz", 35)
riaz.about_me
riaz.bank_account_number
