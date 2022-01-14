require_relative 'dictionary'
class Board
  def initialize(dictionary = '5desk.txt')
    @secret_word = Dictionary.new(dictionary).get_word.chars
    @user_word = Array.new(@secret_word.length, '_')
    @max_fails = 8
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
