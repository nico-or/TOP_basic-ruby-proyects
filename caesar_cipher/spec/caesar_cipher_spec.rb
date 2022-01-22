require './lib/caesar_cipher'

describe 'caesar_cipher' do

  describe 'preservers capitalization' do
    it 'lowercase' do
      expect(caesar_cipher('a', 0)).to eq 'a'
    end

    it 'uppercase' do
      expect(caesar_cipher('A', 0)).to eq 'A'
    end
  end

  describe 'wraps around' do
    it 'z -> a' do
      expect(caesar_cipher('z', 1)).to eq 'a'
    end

    it 'a -> z' do
      expect(caesar_cipher('a', -1)).to eq 'z'
    end
  end

  it 'ignores punctuation' do
    string = '.,!:'
    expect(caesar_cipher(string, 1)).to eq string
  end

  it 'cipher messages' do
    expect(caesar_cipher('What a string!', 5)).to eq 'Bmfy f xywnsl!'
  end
end
