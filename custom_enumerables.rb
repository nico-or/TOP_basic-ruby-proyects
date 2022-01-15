module Enumerable
  def my_each
    index = 0
    until index == length
      yield self[index]
      index += 1
    end
    self
  end
end

# my_each test
puts "Testing my_each"
array = (0..4).to_a
print_block = proc { |i| print "#{i} " }
p array.my_each(&print_block)
p array.each(&print_block)
puts array.my_each(&print_block) == array.each(&print_block)
