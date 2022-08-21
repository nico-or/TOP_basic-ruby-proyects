describe BoardPrinter do
  let(:board_printer) { described_class.new }

  describe '#show' do
    it 'displays a two cell board cell' do
      board_printer.board = [['x', nil], [nil, 'o']]
      expected = <<~out
            a   b
          +---+---+
        1 | x |   |
          +---+---+
        2 |   | o |
          +---+---+
      out

      expect do
        board_printer.show
      end.to output(expected).to_stdout
    end
  end
end
