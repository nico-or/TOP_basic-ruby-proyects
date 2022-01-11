class Move
  attr_reader :move, :feedback

  def initialize(player)
    @move = ""
    @feedback = ""
    get_move(player)
  end

  def to_s
    "#{move} #{feedback}"
  end

  def set_feeback(secret_code)
    @feedback = ""
    @feedback << "o" * count_correct(secret_code, @move)
    @feedback << "x" * count_incorrect(secret_code, @move)
  end

  private

  def get_move(player)
    print "\nCodeBreaker #{player.name}, enter the code guess: "
    input_getter = UserInput::InputGetter.new
    input_getter.set_getter { player.get_move }
    input_getter.set_validator { |i| Mastermind.is_valid_code_guess?(i) }
    @move = input_getter.get_input
    puts
  end

  def count_correct(target, guess)
    tmp = target.split('').zip(guess.split(''))
    tmp.reduce(0) { |sum, a| a[0] == a[1] ? sum + 1 : sum }
  end

  def count_incorrect(target, guess)
    (target.split('') & guess.split('')).count - count_correct(target, guess)
  end
end
