require_relative '../lib/game'

describe Game do

  subject(:game) { described_class.new }

  describe '#initialize' do
    context 'when starting a new game' do

      it 'creates a new board' do
        expect(game.board).not_to eq(nil)
      end

      it 'creates two new players' do
        player_count = game.players.size
        expect(player_count).to eq(2)
      end
    end
  end

  describe '#player_input' do
    context 'when asking for input' do
      let(:input_player) { double('Player', name: 'foo', char: 'x') }

      before do
        allow(game).to receive(:gets).and_return("a2\n")
      end

      it 'request Player name and char' do
        expect(input_player).to receive(:name).once
        expect(input_player).to receive(:char).once
        game.player_input(input_player)
      end

      it 'call gets' do
        expect(game).to receive(:gets).once
        game.player_input(input_player)
      end

      it 'returns a chomped string' do
        output = game.player_input(input_player)
        expect(output).to eq('a2')
      end
    end
  end
end
