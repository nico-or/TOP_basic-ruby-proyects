require_relative 'binary_search_tree'

#Write a simple driver script that does the following:

# Create a binary search tree from an array of random numbers
tree = Tree.new( Array.new(15) { rand(-100..100) } )

# Confirm that the tree is balanced by calling #balanced?
tree.pretty_print
puts tree.balanced?

# Print out all elements in level, pre, post, and in order
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder

# Unbalance the tree by adding several numbers > 100
n = 50
Array.new(n) { rand(-n..n) }.each { |i| tree.insert(i) }

# Confirm that the tree is unbalanced by calling #balanced?
tree.pretty_print
puts tree.balanced?

# Balance the tree by calling #rebalance
tree.rebalance

# Confirm that the tree is balanced by calling #balanced?
tree.pretty_print
puts tree.balanced?

# Print out all elements in level, pre, post, and in order
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder
