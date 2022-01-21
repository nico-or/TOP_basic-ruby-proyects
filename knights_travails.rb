require 'matrix'

#
# The board is mostly useless in this implementatios as you can hardocde
# the board movement restrictrion in a clause like:
#
#   movements.filter { |x, y| x.between(0,7) && (0..7).include? y }
#
# But I implemented it nonetheless for shows and because it might be
# useful to actually display the piece positions.
#
# Also, global variables? oof
#
n = 8
$board = Array.new(n) { Array.new(n) }
0.upto(n - 1) do |i|
  0.upto(n - 1) do |j|
    $board[i][j] = [i, j]
  end
end
puts $board

#
# This method is currently doing two things: listing the 8 posible
# knight moves from a position and verifying which of those moves
# land inside the board. It should be splitted into knight_moves()
# and legal_moves().
# I won't do this because this is a small script, in a bigger program
# the knight should be implemented as a subclass of a Piece class
# encapsulating their paticular move rules, and  probably a board object
# would be in charge of validation the moves of their pieces.
#
# Moves are calculated rotating and reflecting a vector, just because
# I didn't want to write the full movement space, which is probably
# the best options in a game implementation. It's always time to dust-off
# the algebra knowledge
#
def possible_moves(start)
  x, y = start

  # [x, y] => [y, -x] => [-x, -y] => [-y, x] => [x, y]
  rotation = Matrix[[0, 1], [-1, 0]] # pi/2 clockwise rotation
  x_reflection = Matrix[[1, 0], [0, -1]] # [x, y] => [x, -y]
  movement = Matrix.column_vector([2, 1]) # base horse movement

  movements = []
  1.upto(4) do |i| # iterate symmetries
    1.upto(2) do |j|
      movements << ((rotation**i) * (x_reflection**j) * movement).each.to_a
    end
  end

  movements.map! { |dx, dy| [x + dx, y + dy] }
  movements.filter { |xi, yi| $board.dig(xi, yi) }
end

#
# Node class is in charge of hoding his position and its predecesor.
# It also can return all the moves that comprise the list
# It could also be implemented as an array instead of a linked list.
#
class Node
  attr_reader :move, :parent

  def initialize(move, parent = nil)
    @move = move
    @parent = parent
  end

  def path
    out = []
    current = self
    while current
      out << current.move
      current = current.parent
    end
    out
  end

  def to_s
    path.map(&:to_s).join(' ')
  end
end

#
# Performs a breadth-first search on the board filtering any
# move to a position previously visited to reduce the search space
#
def knight_moves(start, finish)
  start = Node.new(start)

  queue = [start]
  until queue.empty?
    current = queue.shift
    return current if current.move == finish

    moves = possible_moves(current.move).map do |move|
      Node.new(move, current) unless current.path.include? move
    end.compact
    queue.push(*moves)
  end
end

def message(node)
  puts "You made it in #{node.path.size} moves!\nHere's your path:"
  puts node.path.reverse.map(&:to_s)
end

message(knight_moves([0, 0], [0, 0]))
message(knight_moves([0, 0], [1, 2]))
message(knight_moves([0, 0], [4, 2]))
message(knight_moves([0, 0], [3, 3]))
message(knight_moves([3, 3], [0, 0]))
message(knight_moves([3, 3], [4, 3]))
