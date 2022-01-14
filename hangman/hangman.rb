require_relative 'messages'
require_relative 'board'
class Game
  include GameMessages

  def initialize
    msg_new_game
    @board = Board.new
    load_saved_game if File.exist? @board.save_file_name
  end

  def play
    until @board.game_over?
      @board.show
      move = user_input
      if move == 'save'
        msg_saving_game
        @board.save_game
        msg_game_saved
        return
      end
      @board.new_move(move)
    end

    if @board.player_won?
      msg_you_win
    else
      msg_you_lose(@board.secret_word)
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

  def load_saved_game
    msg_old_saved_game
    input = ''
    loop do
      input = gets.chomp
      break if %w[y n].include? input

      msg_invalid_input
    end
    @board.load_game if input == 'y'
  end
end

game = Game.new
game.play
