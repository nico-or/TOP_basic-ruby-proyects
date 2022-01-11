class Player
  attr_reader :name, :score

  def initialize
    @name = set_name
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
    name = gets.chomp
    name == "" ? 'Default' : name
  end
end

class Computer < Player

  def get_secret_code
    Mastermind::MOVES.shuffle.first(Mastermind::MOVES_LEN).join('')
  end

  def get_move
    move = ""
    Mastermind::MOVES_LEN.times do
      move << Mastermind::MOVES.sample
    end
    move
  end

  private

  def set_name
    'HAL 9000'
  end
end
