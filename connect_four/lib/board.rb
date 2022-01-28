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

  def update_status(row, col, player)
    @gameover = horizontal_win(row, player.char) || vertical_win(col, player.char)
  end

  def horizontal_win(row, char)
    sum = 0
    @board[row].each do |col|
      sum = 0 if col != char
      sum += 1 if col == char
      return true if sum == 4
    end
    false
  end

  def vertical_win(col, char)
    sum = 0
    @board.each do |row|
      sum = 0 if row[col] != char
      sum += 1 if row[col] == char
      return true if sum == 4
    end
    false
  end
end
