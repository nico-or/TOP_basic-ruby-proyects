class LinkedList
  attr_reader :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if empty?
      @head = new_node
    else
      current = head
      current = current.next while current.next
      current.next = new_node
    end
    @size += 1
  end

  def prepend(value)
    if empty?
      append(value)
    else
      new_node = Node.new(value)
      new_node.next = head
      @head = new_node
    end
    @size += 1
  end

  def tail
    return if empty?

    current = head
    current = current.next while current.next

    current
  end

  def at(index)
    begin
      raise 'Invalid index value' if index > size || index < 0
    rescue StandardError => e
      puts e.message
      return
    end

    current_index = 0
    current_node = head
    until current_index == index
      current_node = current_node.next
      current_index += 1
    end
    current_node
  end

  def pop
    output = self.tail
    if size <= 1
      @head = nil
      @size = 0
    else
      at(size-2).next = nil
      @size -= 1
    end
    output
  end

  def contains?(value)
    current_node = head
    while current_node
      return true if current_node.value == value

      current_node = current_node.next
    end
    false
  end

  def to_s
    return if empty?

    values.map { |i| "( #{i} )" }.join(' -> ') << ' -> nil'
  end

  def values
    values = []
    current = head
    loop do
      values << current.value
      current = current.next
      break unless current
    end
    values
  end

  def empty?
    head == nil
  end
end

class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value = nil)
    @value = value
    @next = nil
  end

  def to_s
    "Node @value = #{value}"
  end
end

puts "\nTesting #append"
list = LinkedList.new
list.append(1)
list.append(2)
list.append('foo')
puts list

puts "\nTesting #prepend"
list.prepend('prepend')
puts list

puts "\nTesting #prepend on emtpy list"
list = LinkedList.new
list.prepend('prepend_empty_list')
puts list

puts "\nTesting #size"
list = LinkedList.new
n = 5
n.times { |i| list.append(i) }
puts list
puts list.size == n

puts "\nTesting #size on empty list"
list = LinkedList.new
puts list
puts list.size == 0

puts "\nTesting #head"
list = LinkedList.new
list.append('head')
list.append('neck?')
puts "List: #{list}"
puts "List head: #{list.head}"

puts "\nTesting #head on empty list "
list = LinkedList.new
puts "List: #{list}"
puts "List head: #{list.head}"

puts "\nTesting #tail"
list = LinkedList.new
list.append('#head')
list.append('#tail')
puts "List: #{list}"
puts "List tail: #{list.tail}"

puts "\nTesting #tail on empty list "
list = LinkedList.new
puts "List: #{list}"
puts "List tail: #{list.tail}"

puts "\nTesting #index"
list = LinkedList.new
n = 5
n.times { |i| list.append(i) }
puts list
puts "Node at 0: #{list.at(0)}"
puts "Node at 2: #{list.at(2)}"
puts "Node at -1: #{list.at(-1)}"
puts "Node at 100: #{list.at(100)}"

puts "\nTesting #pop"
list = LinkedList.new
n = 5
n.times { |i| list.append(i) }
puts "initial list: #{list}"
(n+1).times { puts "#pop: #{list.pop}, new list = #{list}" }
puts "final list: #{list}"

puts "\nTesting #contains?"
list = LinkedList.new
n = 5
n.times { |i| list.append(i) }
puts "List: #{list}"
puts "list.contains? 2: #{list.contains?(2)}"
puts "list.contains? 'foo': #{list.contains?('foo')}"
