class Dictionary
  attr_reader :words

  def initialize(filename = '5desk.txt')
    @words = File.open(filename, 'r').readlines.map { |i| i.chomp.downcase }
  end

  def get_word
    words_in_range.sample
  end

  private

  def words_in_range(min = 5, max = 12)
    @words.filter { |i| i.length.between?(min, max) }
  end
end

class Game
  attr_reader :dictionary, :secret_word

  def initialize
    puts "\nNew Game"
    @dictionary = Dictionary.new('sample.txt')
    @secret_word = dictionary.get_word
  end

  def play
    puts @secret_word
  end
end

game = Game.new
game.play
