require_relative 'dictionary'
class Board
  def initialize(dictionary = '5desk.txt')
    @secret_word = Dictionary.new(dictionary).get_word.chars
    @user_word = Array.new(@secret_word.length, '_')
    @max_fails = 8
    @fail_count = 0
    @correct_guesses = []
    @incorrect_guesses = []
  end

  def show
    puts previous_moves
    puts user_attemps
    puts user_word
  end

  def new_move(guess)
    return if (@correct_guesses + @incorrect_guesses).include? guess

    if @secret_word.include? guess
      @correct_guesses << guess
      update_user_word(guess)
    else
      @incorrect_guesses << guess
      @fail_count += 1
    end
  end

  def is_over?
    player_won? or player_lose?
  end

  def player_won?
    @user_word.none? '_'
  end

  def player_lose?
    @fail_count == @max_fails
  end

  private

  def user_attemps
    "Fail Count: #{'x' * @fail_count}#{'o' * (@max_fails - @fail_count)}"
  end

  def user_word
    "Progress: #{@user_word.join(' ')}"
  end

  def update_user_word(guess)
    @secret_word.each_with_index do |char, idx|
      @user_word[idx] = char if char == guess
    end
  end

  def previous_moves
    "\n\n  Correct guesses:#{@correct_guesses.join(' ')}\n" \
    "Incorrect guesses:#{@incorrect_guesses.join(' ')}\n\n"
  end
end
