require_relative '../lib/board'

describe Board do

  subject(:game_board) { described_class.new }
  let(:player1) { double('Player', char: 'x') }
  let(:player2) { double('Player', char: 'o') }

  describe '#valid_move?' do
    context 'when given a valid move' do
      it 'returns true' do
        move = '1'
        result = game_board.valid_move? move
        expect(result).to eq(true)
      end
    end
    context 'when given an invalid move' do
      context 'number input' do
        it 'returns true' do
          move = '0'
          result = game_board.valid_move? move
          expect(result).to eq(false)
        end
      end
      context 'letter input' do
        it 'returns true' do
          move = 'a'
          result = game_board.valid_move? move
          expect(result).to eq(false)
        end
      end
      context 'empty input' do
        it 'returns true' do
          move = ''
          result = game_board.valid_move? move
          expect(result).to eq(false)
        end
      end
    end
  end

  describe '#add_move' do

    subject(:small_board) { described_class.new(2,3) }
    # => [[' ', ' ', ' '],[' ', ' ', ' ']]

    context 'when reciving a single input' do
      it 'updates the board' do
        move = '2'
        small_board.add_move(move, player1)
        new_board = small_board.board
        expected_board = [[' ', 'x', ' '], [' ', ' ', ' ']]
        expect(new_board).to eq(expected_board)
      end
    end
    context 'when reciving two moves' do
      context 'different columns' do
        it 'updates the board' do
          move = '2'
          small_board.add_move(move, player1)
          move = '1'
          small_board.add_move(move, player2)
          new_board = small_board.board
          expected_board = [['o',   'x', ' '], [' ', ' ', ' ']]
          expect(new_board).to eq(expected_board)
        end
      end
      context 'same column' do
        it 'updates the board' do
          move = '1'
          small_board.add_move(move, player1)
          move = '1'
          small_board.add_move(move, player2)
          new_board = small_board.board
          expected_board = [['x', ' ', ' '], ['o', ' ', ' ']]
          expect(new_board).to eq(expected_board)
        end
      end
    end
  end

  describe '#game_over?' do
    context 'when a game starts' do
      it 'returns false' do
        status = game_board.game_over?
        expect(status).to eq(false)
      end
    end

    context 'when there isn\'t a winner' do
      it 'returns false' do
        game_board.add_move(1, player1)
        game_board.add_move(2, player2)
        game_board.add_move(1, player1)
        status = game_board.game_over?
        expect(status).to eq(false)
      end
    end

    context 'when 4 in a row' do
      it 'returns true' do
        1.upto(4) { |row| game_board.add_move(row, player1) }
        status = game_board.game_over?
        expect(status).to eq(true)
      end
    end
  end
end
