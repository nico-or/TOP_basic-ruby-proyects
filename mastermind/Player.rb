class Player
  attr_reader :name, :score

  def initialize
    @name = set_name || "Default"
    @score = 0
  end

  def to_s
    "#{name}: #{score} points"
  end

  def update_score(points)
    @score += points
  end

end

class Human < Player

  def get_move
    input_promp
  end

  def get_secret_code
    input_promp
  end

  private

  def input_promp
    gets.chomp
  end

  def set_name
    print "Enter player name: "
    gets.chomp
  end
end

class Computer < Player

  def get_secret_code
    Mastermind::MOVES.shuffle.first(Mastermind::MOVES_LEN).join('')
  end

  private

  def set_name
    'HAL 9000'
  end
end
