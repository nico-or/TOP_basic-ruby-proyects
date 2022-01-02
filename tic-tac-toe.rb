class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    self.show
    @available_moves = (
      (('a'..'c').to_a).product(('1'..'3').to_a)
    ).map { |i| i.join('') }
    @winner = nil
  end

  def show
    puts "   a   b   c "
    @board.each_with_index do |row, index|
      puts (index+1).to_s + '  ' + row.join(' | ')
      puts '  ' + Array.new(3,'---').join('+')  unless index == 2
    end
    puts
  end

  def add_move(move, char)
    column, row = parse_move(move)
    @board[row][column] = char
    @available_moves.delete(move)
    self.show
  end

  private
  def parse_move(move)
    [move[0].ord - 'a'.ord, move[1].to_i - 1]
  end

  public
  def valid_move?(move)
    return false unless @available_moves.include? move
    true
  end

  def winner?
    false
  end
end

# game loop
def turn(board, player_number)
  char  = player_number == 1 ? 'x' : 'o'
  print "Player #{player_number} (#{char}), enter your move: "
  loop do
    move = gets.chomp
    if board.valid_move? move
      board.add_move(move,char)
      break
    else
      print "Invalid move, try again "
    end
  end
end

def main
  board = Board.new
  player_number = 1
  until board.winner?
    turn(board, player_number)
    player_number = player_number == 1 ? 2 : 1
  end
end

main
