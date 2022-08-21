class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }

    @printer = BoardPrinter.new
    @printer.board = @board
  end

  def show
    @printer.show
  end
end
