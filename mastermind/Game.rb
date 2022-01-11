require_relative 'Player'
require_relative 'Board'

class Game
  def initialize
    @players = []
    select_game_type
    greet_players
  end

  def play
    round
    game_over
  end

  private

  def round
    @board = Board.new(@players)
    loop do
      @board.new_move
      break if @board.game_over?
    end
    puts "Round Over"
  end

  def select_game_type
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
    @players.each do |player|
      puts "Welcome #{player.name}"
    end
  end

  def game_over
    puts"\nGame Over"
    puts "\nFinal Score"
    @players.each { |i| puts i }
  end
end

game = Game.new
game.play
