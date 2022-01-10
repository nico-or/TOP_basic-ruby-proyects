require_relative 'Move'

class Board

  def initialize
    @moves = []
    @secret_code = set_secret_code
    @game_over = true
    puts "New Board"
  end

  def new_move(player)
    @moves << Move.new(player)
  end

  def game_over?
    @game_over
  end

  private

  def set_secret_code
    print "Defense Player, enter new secret code: "
    gets.chomp
  end
end
