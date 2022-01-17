class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if head
      current = head
      current = current.next while current.next
      current.next = new_node
    else
      @head = new_node
    end
  end

  def prepend(value)
    if head
      new_node = Node.new(value)
      new_node.next = head
      @head = new_node
    else
      append(value)
    end
  end

  def to_s
    return unless head

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
end

class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value = nil)
    @value = value
    @next = nil
  end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.append('foo')
list.prepend('prepend')
p list
puts list

list_2 = LinkedList.new
list_2.prepend('prepend_empty_list')
puts list_2
