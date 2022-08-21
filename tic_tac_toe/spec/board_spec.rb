describe Board do

  subject(:board) { described_class.new }

  describe '#show' do
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
