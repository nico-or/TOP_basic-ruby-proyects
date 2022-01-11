class Board
  attr_reader :code_maker, :code_breaker
  def initialize(players)
    @moves = []
    @game_over = true
    set_players_roles(players)
    set_secret_code(code_maker)
    puts "New Board"
  end

  def new_move
    @moves << Move.new(code_breaker)
  end

  def game_over?
    @game_over
  end

  private

  def set_players_roles(players)
    puts "\nWhich player will be the Code Maker?"
    players.each.with_index { |player, i| puts "#{i+1}) #{player.name}" }

    input_getter = UserInput::InputGetter.new
    input_getter.set_getter { gets.chomp }
    input_getter.set_validator { |i| %w{1 2}.include? i }

    case '2'#input_getter.get_input
    when '1'
      @code_maker = players[0]
      @code_breaker = players[1]
    when '2'
      @code_maker = players[1]
      @code_breaker = players[0]
    end
    puts "Code Maker: #{code_maker.name}"
    puts "Code Breaker: #{code_breaker.name}"
  end

  def set_secret_code(player)
    print "\nCodeMaker #{player.name}, enter the secret code: "
    input_getter = UserInput::InputGetter.new
    input_getter.set_getter { player.get_secret_code }
    input_getter.set_validator { |i| Mastermind.is_valid_secret_code?(i) }
    @secret_code = input_getter.get_input
  end
end
