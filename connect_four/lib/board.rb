class Board
  attr_reader :board

  def initialize(rows = 6, cols = 7)
    @rows = rows
    @cols = cols
    @board = Array.new(rows) { Array.new(cols, ' ') }
    @gameover = false
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
    column = move.to_i - 1
    row = 0
    row += 1 while @board[row][column] != ' '

    @board[row][column] = player.char
    update_status(row, column, player)
  end

  def valid_move?(move)
    return false unless move.respond_to?(:to_i)

    (1..@cols).include? move.to_i
  end

  def game_over?
    @gameover
  end

  private

  def update_status(row, col, player); end
end
