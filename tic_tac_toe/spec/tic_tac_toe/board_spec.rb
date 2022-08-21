describe TicTacToe::Board do

  subject(:game_board) { described_class.new }

  describe '#valid_move?' do
    context 'when given a valid move' do
      it 'returns true' do
        move = 'b2'
        ans = game_board.valid_move? move
        expect(ans).to eq(true)
      end
    end

    context 'when given an invalid move' do
      it 'returns false' do
        move = 'a5'
        ans = game_board.valid_move? move
        expect(ans).to eq(false)
      end
    end
  end

  describe '#add_move' do
    context 'when given a new move' do
      it 'updates the board' do
        game_board.add_move('a1', 'x')
        new_board = game_board.instance_variable_get(:@board)
        final_board = [['x', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
        expect(new_board).to eq(final_board)
      end
    end

    context 'when given two new moves' do
      it 'updates the board' do
        game_board.add_move('a1', 'x')
        game_board.add_move('b2', 'o')
        new_board = game_board.instance_variable_get(:@board)
        final_board = [['x', ' ', ' '], [' ', 'o', ' '], [' ', ' ', ' ']]
        expect(new_board).to eq(final_board)

      end
    end
  end

  describe '#gameover?' do
    context 'when vertical win' do
      it 'returns true' do
        game_board.add_move('a1', 'x')
        game_board.add_move('a2', 'x')
        game_board.add_move('a3', 'x')
        expect(game_board.gameover?).to be true
      end
    end
    context 'when horizontal win' do
      it 'returns true' do
        game_board.add_move('a2', 'x')
        game_board.add_move('b2', 'x')
        game_board.add_move('c2', 'x')
        expect(game_board.gameover?).to be true
      end
    end
    context 'when diagonal 1 win' do
      it 'returns true' do
        game_board.add_move('c1', 'o')
        game_board.add_move('b2', 'o')
        game_board.add_move('a3', 'o')
        expect(game_board.gameover?).to be true
      end
    end
    context 'when diagonal 2 win' do
      it 'returns true' do
        game_board.add_move('a1', 'o')
        game_board.add_move('b2', 'o')
        game_board.add_move('c3', 'o')
        expect(game_board.gameover?).to be true
      end
    end
    context 'when no moves played' do
      it 'returns false' do
        expect(game_board.gameover?).to be false
      end
    end
    context 'when single move played' do
      it 'returns false' do
        game_board.add_move('b2', 'x')
        expect(game_board.gameover?).to be false
      end
    end
  end

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

        expect { game_board.show }.to output(expected).to_stdout
      end
    end
  end
end
