module Enumerable
  def my_each
    index = 0
    until index == length
      yield self[index]
      index += 1
    end
    self
  end

  def my_each_with_index
    index = 0
    until index == length
      yield(self[index], index)
      index += 1
    end
    self
  end

  def my_select
    arr = []
    each do |var|
      arr << var if yield var
    end
    arr
  end

  def my_all?
    each do |var|
      return false unless yield var
    end
    true
  end
end

blank_proc = proc { }

# my_each test
puts "Testing my_each"
array = (0..4).to_a
print_block = proc { |i| print "#{i} " }
p array.my_each(&print_block)
p array.each(&print_block)
puts array.my_each(&blank_proc) == array.each(&blank_proc)

# my_each_with_index test
puts "Testing my_each_with_index"
array = ('a'..'e').to_a
print_with_index_block = proc { |val, idx| puts "index: #{idx} value: #{val}" }
p array.my_each_with_index(&print_with_index_block)
p array.each_with_index(&print_with_index_block)
puts array.my_each_with_index(&blank_proc) == array.each_with_index(&blank_proc)

# my_select test
puts "Testing my_select"
array = (0..5).to_a
test_proc = proc { |i| i.even?}
p array.my_select(&test_proc)
p array.select(&test_proc)
p array.my_select(&test_proc) == array.select(&test_proc)

# my_all? test
puts "Testing my_all?"
array = (0..5).to_a
test_proc = proc { |i| i.even?}
p array.my_all?(&test_proc) == array.all?(&test_proc)

array = [0, 2, 4]
test_proc = proc { |i| i.even?}
p array.my_all?(&test_proc) == array.all?(&test_proc)
