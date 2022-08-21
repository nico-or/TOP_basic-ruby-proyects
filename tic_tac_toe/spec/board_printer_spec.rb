describe BoardPrinter do
  let(:board_printer) { described_class.new }

  describe '#show' do
    context 'single cell board' do
      context 'on an empty board' do
        it 'displays a single cell' do
          board_printer.board = [[nil]]
          expected = <<~out
            +---+
            |   |
            +---+
          out

          expect do
            board_printer.show
          end.to output(expected).to_stdout
        end
      end

      context 'on an non-empty board' do
        it 'displays a single cell' do
          board_printer.board = [['x']]
          expected = <<~out
            +---+
            | x |
            +---+
          out

          expect do
            board_printer.show
          end.to output(expected).to_stdout
        end
      end
    end

    context 'two cell board' do
      it 'displays a two cell board cell' do
        board_printer.board = [['x', nil]]
        expected = <<~out
          +---+---+
          | x |   |
          +---+---+
        out

        expect do
          board_printer.show
        end.to output(expected).to_stdout
      end
    end

    context 'square board' do
      it 'displays a two cell board cell' do
        board_printer.board = [['x', nil], [nil, 'o']]
        expected = <<~out
          +---+---+
          | x |   |
          +---+---+
          |   | o |
          +---+---+
        out

        expect do
          board_printer.show
        end.to output(expected).to_stdout
      end
    end
  end
end
