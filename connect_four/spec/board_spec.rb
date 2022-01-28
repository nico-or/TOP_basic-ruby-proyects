require_relative '../lib/board'

describe Board do

  subject(:game_board) { described_class.new }

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
end
