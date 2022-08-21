class Board
  attr_reader :rows, :cols

  def initialize(rows, cols = rows)
    @rows = rows
    @cols = cols
    @board = Array.new(rows) { Array.new(cols, ' ') }

    @printer = BoardPrinter.new
    @printer.board = @board
  end

  def show
    @printer.show
  end
end
