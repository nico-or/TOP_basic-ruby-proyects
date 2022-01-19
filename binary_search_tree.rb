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
end

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return if array.empty?

    array = array.uniq.sort
    center = array.length/2

    root = Node.new(array[center])
    root.left = build_tree(array[0...center])
    root.right = build_tree(array[center+1..])

    return root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end


tree = Tree.new((0..5).to_a)
tree.pretty_print
