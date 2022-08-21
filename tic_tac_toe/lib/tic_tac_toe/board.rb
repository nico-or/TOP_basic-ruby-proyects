module TicTacToe
  class Board < Board
    DEFAULT_BOARD_SIZE = 3

    def initialize
      super(DEFAULT_BOARD_SIZE)

      @available_moves =
        ('a'..'c').to_a.product(('1'..'3').to_a)
                  .map(&:join)
      @winner = 'player'
    end

    def add_move(move, char)
      column, row = parse_move(move)
      @board[row][column] = char
      @available_moves.delete(move)
    end

    def winner
      @winner
    end

    def valid_move?(move)
      return false unless @available_moves.include? move

      true
    end

    def gameover?
      if  self.tie? || self.row_win? || self.column_win? || self.diagonal_win?
        return true
      end
      false
    end

    private

    def parse_move(move)
      [move[0].ord - 'a'.ord, move[1].to_i - 1]
    end

    def tie?
      if @available_moves.length == 0
        @winner = 'tie'
        return true
      end
      false
    end

    def allsame?(row)
      return false if row[0] == ' '

      row.all? { |i| i == row[0] }
    end

    def row_win?
      @board.each do |row|
        return true if allsame? row
      end
      false
    end

    def column_win?
      @board.transpose.any? do |row|
        return true if allsame? row
      end
      false
    end

    def diagonal_win?
      diag1 = (0..2).map { |i| @board.dig(i, i) }
      diag2 = (0..2).map { |i| @board.dig(2 - i, i) }
      allsame?(diag1) || allsame?(diag2)
    end
  end
end
