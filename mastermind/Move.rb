class Move
  def initialize
    loop do
      move = get_input
      if is_valid? move
        @move = move
        break
      end
    end
  end

  private

  def get_input
    print "Attack Player, enter new guess: "
    gets.chomp
  end

  def is_valid?(move)
    true
  end
end
