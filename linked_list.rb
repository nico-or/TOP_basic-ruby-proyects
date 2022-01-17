class LinkedList
  attr_reader :head
  def initialize
    @head = nil
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
p list
puts list
