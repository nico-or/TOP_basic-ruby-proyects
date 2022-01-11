class Board
  attr_reader :moves, :secret_code

  def initialize(code_maker)
    puts "\nNew Board"
    @moves = []
    set_secret_code(code_maker)
  end

  def new_move(code_breaker)
    move = Move.new(code_breaker)
    move.set_feeback(secret_code)
    @moves << move
    show_moves
  end

  def game_over?
    return true if moves.length == Mastermind::GUESS_COUNT
    return true if moves.last.feedback == 'oooo'
    false
  end

  def score
    return 12 if moves.length == Mastermind::GUESS_COUNT
    moves.length - 1
  end

  private

  def set_secret_code(player)
    print "\nCodeMaker #{player.name}, enter the secret code: "
    input_getter = UserInput::InputGetter.new
    input_getter.set_getter { player.get_secret_code }
    input_getter.set_validator { |i| Mastermind.is_valid_secret_code?(i) }
    @secret_code = input_getter.get_input
    puts
  end

  def show_moves
    puts " Round | Guess | Feedback "
    @moves.each.with_index do |move, index|
      arr = [
        (index+1).to_s.rjust(5),
        move.move.rjust(5),
        move.feedback.ljust('feedback'.length)
      ]
      puts " #{arr.join(' | ')} "
    end
  end
end
