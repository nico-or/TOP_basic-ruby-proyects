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

class Board
  def initialize(dictionary = '5desk.txt')
    @secret_word = Dictionary.new(dictionary).get_word
    @user_word = Array.new(@secret_word.length,'_')
    @max_fails = 5
    @fail_count = 0
  end

  def show
    puts user_attemps
    puts user_word
  end

  private
  def user_attemps
    'Fail Count: ' + 'x' * @fail_count + 'o' * (@max_fails - @fail_count)
  end
  def user_word
    'Progress: ' + @user_word.join(' ')
  end
end
class Game
  attr_reader :dictionary, :secret_word

  def initialize
    puts "\nNew Game"
    @board = Board.new('sample.txt')
  end

  def play
    @board.show
  end
end

game = Game.new
game.play
