require_relative 'messages'
require_relative 'board'
class Game
  include GameMessages

  def initialize
    msg_new_game
    @board = Board.new

    if File.exists? @board.save_file_name
      msg_old_saved_game
      input = loop do
        input = gets.chomp
        break(input) if %w{y n}.include? input
        msg_invalid_input
      end
      @board.load_game if input == 'y'
    end
  end

  def play
    until @board.is_over?
      @board.show
      if 'save' == move = user_input
        msg_saving_game
        @board.save_game
        msg_game_saved
        return
      end
      @board.new_move(move)
    end

    if @board.player_won? then msg_you_win
    else msg_you_lose(@board.secret_word)
    end
  end

  private

  def user_input
    msg_new_guess
    valid_input = ('a'..'z').to_a << 'save'
    loop do
      guess = gets.chomp
      break(guess) if valid_input.include? guess

      msg_invalid_input
    end
  end
end

game = Game.new
game.play
