require_relative 'messages'
require_relative 'board'
class Game
  include GameMessages

  def initialize
    msg_new_game
    @board = Board.new('sample.txt')
  end

  def play
    loop do
      @board.show
      @board.new_move(user_input)
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
