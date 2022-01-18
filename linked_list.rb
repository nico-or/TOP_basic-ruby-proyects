class LinkedList
  attr_reader :head

  def initialize
    @head = nil
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
  end

  def prepend(value)
    if empty?
      append(value)
    else
      new_node = Node.new(value)
      new_node.next = head
      @head = new_node
    end
  end

  def size
    count = 0
    current = head
    while current
      count += 1
      current = current.next
    end
    count
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
