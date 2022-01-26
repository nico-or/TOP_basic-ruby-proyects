class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    self.show
    @available_moves = (
      (('a'..'c').to_a).product(('1'..'3').to_a)
    ).map { |i| i.join('') }
    @winner = 'player'
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

  def winner
    @winner
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

  private
  def tie?
    if @available_moves.length == 0
      @winner = 'tie'
      return true
    end
    false
  end

  def allsame? (row)
    return false if row[0] == " "
    row.all? {|i| i == row[0]}
  end

  def row_win?
    @board.each do |row|
      return true if self.allsame? row
    end
    false
  end

  def column_win?
    @board.transpose.any? do |row|
      return true if self.allsame? row
    end
    false
  end

  def diagonal_win?
    diag1 = (0..2).map {|i| @board.dig(i, i)}
    diag2 = (0..2).map {|i| @board.dig(2 - i, i)}
    self.allsame?(diag1) || self.allsame?(diag2)
  end

  public
  def gameover?
    if  self.tie? || self.row_win? || self.column_win? || self.diagonal_win?
      return true
    end
    false
  end
end
