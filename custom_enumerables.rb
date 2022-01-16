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

  def my_any?
    each do |var|
      return true if yield var
    end
    false
  end

  def my_none?
    each do |var|
      return false if yield var
    end
    true
  end

  def my_count(val = nil)
    return length unless val

    count = 0
    self.each do |i|
      count += 1 if i == val
    end
    count
  end

  def my_map(&block)
    arr = []
    self.each do |i|
      arr << yield(i)
    end
    arr
  end

  def my_inject(start=nil, &block)
    bar = self.to_a
    unless start
      foo = bar.shift
    else
      foo = start
    end
    bar.each do |i|
      foo = yield(foo, i)
    end
    foo
  end
end

blank_proc = proc {}

# my_each test
puts 'Testing my_each'
array = (0..4).to_a
print_block = proc { |i| print "#{i} " }
p array.my_each(&print_block)
p array.each(&print_block)
puts array.my_each(&blank_proc) == array.each(&blank_proc)

# my_each_with_index test
puts 'Testing my_each_with_index'
array = ('a'..'e').to_a
print_with_index_block = proc { |val, idx| puts "index: #{idx} value: #{val}" }
p array.my_each_with_index(&print_with_index_block)
p array.each_with_index(&print_with_index_block)
puts array.my_each_with_index(&blank_proc) == array.each_with_index(&blank_proc)

# my_select test
puts 'Testing my_select'
array = (0..5).to_a
test_proc = proc { |i| i.even? }
p array.my_select(&test_proc)
p array.select(&test_proc)
p array.my_select(&test_proc) == array.select(&test_proc)

# my_all? test
puts 'Testing my_all?'
array = (0..5).to_a
test_proc = proc { |i| i.even? }
p array.my_all?(&test_proc) == array.all?(&test_proc)

array = [0, 2, 4]
test_proc = proc { |i| i.even? }
p array.my_all?(&test_proc) == array.all?(&test_proc)

# my_any? test
puts 'Testing my_any?'
array = (0..5).to_a
test_proc = proc { |i| i.odd? }
p array.my_any?(&test_proc) == array.any?(&test_proc)

array = [0, 2, 4]
test_proc = proc { |i| i.odd? }
p array.my_any?(&test_proc) == array.any?(&test_proc)

# my_none? test
puts 'Testing my_none?'
array = (0..5).to_a
test_proc = proc { |i| i.odd? }
p array.my_none?(&test_proc) == array.none?(&test_proc)

array = [0, 2, 4]
test_proc = proc { |i| i.odd? }
p array.my_none?(&test_proc) == array.none?(&test_proc)

# my_count test
puts 'Testing my_count'
array = %w[a a b c d]
p array.my_count == array.count
p array.my_count('a') == array.count('a')
p array.my_count('d') == array.count('d')
p array.my_count(1) == array.count(1)

# my_map test
puts 'Testing my_map'
array = (0..5).to_a
test_proc = proc { |i| i**2 }
p array.my_map(&test_proc) == array.map(&test_proc)

# my_inject test
puts 'Testing my_inject'
#p (5..10).my_inject(:+) == 45
p (5..10).my_inject { |sum, n| sum + n } == 45
#p (5..10).my_inject(1, :*) == 151200
p (5..10).my_inject(1) { |product, n| product * n } == 151200
longest = %w{ cat sheep bear }.my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
p longest == 'sheep'

def multiply_els(arr)
  arr.my_inject {|prod, i| prod * i }
end
p multiply_els([2, 4, 5]) == 40
