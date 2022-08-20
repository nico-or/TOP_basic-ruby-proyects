class Player
  attr_reader :name, :char

  def initialize(name, char)
    @name = name
    @char = char
  end

  def get_input
    print "#{name} (#{char}), enter your move: "
    gets.chomp
  end
end
