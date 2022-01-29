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

    col = move.to_i - 1
    !column_full?(col) && (0...@cols).include?(col)
  end

  def game_over?
    @gameover
  end

  def column_full?(col)
    board.each { |row| return false if row[col] == ' ' }
    true
  end

  private

  def update_status(row, col, player)
    @gameover = horizontal_win(row, player.char) ||
                vertical_win(col, player.char) ||
                diagonal_win(row, col, player.char)
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

  def diagonal_win(row, col, char)
    upward_diagonal(row, col, char) || downward_diagonal(row, col, char)
  end

  def upward_diagonal(row, col, char)
    delta = [row, col].min
    current_row = row - delta
    current_col = col - delta
    sum = 0
    while (value = @board.dig(current_row, current_col))
      sum += 0 if value != char
      sum += 1 if value == char
      return true if sum == 4

      current_row += 1
      current_col += 1
    end
    false
  end

  def downward_diagonal(row, col, char)
    delta = [row, @cols - col].min
    current_row = row - delta
    current_col = col + delta
    sum = 0
    while (value = @board.dig(current_row, current_col))
      sum += 0 if value != char
      sum += 1 if value == char
      return true if sum == 4

      current_row += 1
      current_col -= 1
    end
    false
  end
end
