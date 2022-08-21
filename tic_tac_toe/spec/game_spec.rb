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

  describe '#play' do
    it 'plays a complete game' do
      game = described_class.new
      players = game.players

      allow(players[0]).to receive(:get_input).and_return('a1', 'a2', 'a3')
      allow(players[1]).to receive(:get_input).and_return('b1', 'b2', 'b3')

      expect do
        game.play
      end.to output(/GAME OVER/).to_stdout
    end
  end
end
