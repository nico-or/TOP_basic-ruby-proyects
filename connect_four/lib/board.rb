class Board
  attr_reader :board

  def initialize(rows = 6, cols = 7)
    @rows = rows
    @cols = cols
    @board = Array.new(rows) { Array.new(cols, ' ') }
  end

  def show
    puts (1..@cols).to_a.join(' ')
    puts '=' * ((2 * @cols) - 1)
    board.reverse.each do |row|
      puts row.join('|')
      puts '-' * ((2 * @cols) - 1)
    end
  end

  def add_move(move, player)
    # i guess?
  end

  def valid_move?(_move)
    false
  end

  def game_over?
    false
  end
end
