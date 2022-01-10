class Player
  attr_reader :name

  def initialize
    @name = set_name || "Default"
    @score = 0
  end

  def get_move
    gets.chomp
  end

  def to_s
    "#{@name}: #{@score} points"
  end

  private

  def set_name
    #print "Enter player name: "
    #gets.chomp
  end

end

class Computer < Player

  private

  def set_name
    'HAL 9000'
  end
end
