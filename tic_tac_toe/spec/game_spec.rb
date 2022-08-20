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
end
