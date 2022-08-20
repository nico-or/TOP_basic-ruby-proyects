describe Player do
  let(:player) { described_class.new('name', 'x') }

  describe '#get_input' do
    it 'gets input' do
      allow(player).to receive(:gets).and_return("a2\n")

      input = player.get_input

      expect(input).to eq('a2')
      expect(player).to have_received(:gets)
    end
  end
end
