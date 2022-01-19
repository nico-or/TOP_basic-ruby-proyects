class Node
  attr_accessor :data, :left, :right

  include Comparable

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    data <=> other.data
  end

  def childrens
    [left, right]
  end

  def child_count
    childrens.compact.size
  end

  def successor
    left_successor || right_successor
  end

  # find biggest left descendant node
  def left_successor
    return unless left

    current = left
    value = current.data
    while current.right
      value = current.data if current.data > value
      current = current.right
    end
    current
  end

  # find smallest right descendant node
  def right_successor
    return unless right

    current = right
    value = current.data
    while current.left
      value = current.data if current.data < value
      current = current.left
    end
    current
  end
end

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return if array.empty?

    array = array.uniq.sort
    center = array.length / 2

    root = Node.new(array[center])
    root.left = build_tree(array[0...center])
    root.right = build_tree(array[center + 1..])
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def find(value, node = @root)
    return node if node.data == value

    left = node.left ? find(value, node.left) : nil
    right = node.right ? find(value, node.right) : nil
    left || right
  end

  def insert(value)
    return if find(value)

    insert_rec(value)
  end

  def insert_rec(value, node = @root)
    if value < node.data
      node.left ? insert_rec(value, node.left) : node.left = Node.new(value)
    else
      node.right ? insert_rec(value, node.right) : node.right = Node.new(value)
    end
  end
end

tree = Tree.new((0..5).to_a)
tree.pretty_print
