describe Board do
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
