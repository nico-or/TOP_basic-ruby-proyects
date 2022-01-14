require_relative 'messages'
require_relative 'board'
class Game
  include GameMessages

  def initialize
    msg_new_game
    @board = Board.new('sample.txt')
  end

  def play
    until @board.is_over?
      @board.show
      @board.new_move(user_input)
    end

    if @board.player_won? then msg_you_win
    else msg_you_lose(@board.secret_word)
    end
  end

  private

  def user_input
    msg_new_guess
    loop do
      guess = gets.chomp
      break(guess) if ('a'..'z').include? guess

      msg_invalid_input
    end
  end
end

game = Game.new
game.play
