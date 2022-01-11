require_relative 'Board'
require_relative 'Player'
require_relative 'Move'
require_relative 'Mastermind'
require_relative 'UserInput'

class Game
  attr_reader :players, :code_maker, :code_breaker
  def initialize
    @players = []
    set_game_type
    greet_players
    set_players_roles(players)
  end

  def play
    round
    game_over
  end

  private

  def round
    @board = Board.new(code_maker)
    loop do
      @board.new_move(code_breaker)
      break if @board.game_over?
    end

    puts "\nRound Over"
  end

  def set_game_type
    add_human
    add_computer
  end

  def add_human
    @players << Human.new
  end

  def add_computer
    @players << Computer.new
  end

  def greet_players
    puts ""
    @players.each do |player|
      puts "Welcome #{player.name}"
    end
  end

  def set_players_roles(players)
    puts "\nWhich player will be the Code Maker?"
    players.each.with_index { |player, i|
      puts "#{i+1}) #{player.name}" }

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
    puts "\nCode Maker: #{code_maker.name}"
    puts "Code Breaker: #{code_breaker.name}"
  end

  def game_over
    puts"\nGame Over"
    puts "\nFinal Score"
    @players.each { |i| puts i }
  end
end

game = Game.new
game.play
