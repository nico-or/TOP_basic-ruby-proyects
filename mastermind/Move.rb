class Move
  def initialize(player)
    @move = get_move(player)
  end

  private

  def get_move(player)
    loop do
      print "#{player.name}, enter new guess: "
      move = player.get_move
      return move if is_valid? move
      puts "Invalid move, try again."
    end
  end

  def is_valid?(move)
    true
  end
end
