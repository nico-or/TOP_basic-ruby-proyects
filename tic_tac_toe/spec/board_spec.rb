describe Board do
  describe'#rows' do
    it 'returns the number of rows for a symmetrical board' do
      rows = 5
      board = Board.new(rows)
      expect(board.rows).to eq(rows)
    end

    it 'returns the number of rows for an asymmetrical board' do
      rows = 5
      cols = 3
      board = Board.new(rows, cols)
      expect(board.rows).to eq(rows)
    end
  end

  describe'#cols' do
    it 'returns the number of rows for a symmetrical board' do
      rows = 5
      board = Board.new(rows)
      expect(board.cols).to eq(rows)
    end

    it 'returns the number of rows for an asymmetrical board' do
      rows = 5
      cols = 3
      board = Board.new(rows, cols)
      expect(board.cols).to eq(cols)
    end
  end

  describe '#show' do
    let(:board) { described_class.new(3) }

    context 'a new board' do
      it 'prints to stdout' do
        expected = <<~out
             a   b   c
           +---+---+---+
         1 |   |   |   |
           +---+---+---+
         2 |   |   |   |
           +---+---+---+
         3 |   |   |   |
           +---+---+---+
        out

        expect { board.show }.to output(expected).to_stdout
      end
    end
  end
end
