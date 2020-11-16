def one_yeild
  yield
end

def two_yeild
  yield
  yield
end

one_yeild { puts "yielded once" }
two_yeild { puts "yielded Twice" }

# def yield_without_a_block
#   yield
# end
#
# p yield_without_a_block

def optional_block
  yield if block_given?
end

optional_block
optional_block { puts "block given" }

def yield_with_arguments
  hello = "Hello"
  world = "World"

  yield(hello, world)
end

yield_with_arguments { |arg1, arg2| puts "#{arg1} #{arg2}" }

class Array
  def my_arr
    return self.dup unless block_given?
    arr = []
    self.each do |element|
      arr << yield(element)
    end
    arr
  end
end
first_array = [1, 2, 3]
p first_array.my_arr { |ele| ele * 2 }
p first_array.my_arr
p first_array
