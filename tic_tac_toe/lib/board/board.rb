class Board
  def initialize(rows, cols = rows)
    @board = Array.new(rows) { Array.new(cols, ' ') }

    @printer = BoardPrinter.new
    @printer.board = @board
  end

  def show
    @printer.show
  end
end
