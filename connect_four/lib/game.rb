require_relative 'board'

class Player
  attr_reader :name, :char

  def initialize(name, char)
    @name = name
    @char = char
  end
end

class Game
  attr_reader :board
  def initialize
    @board = Board.new
    @players = [
      Player.new('player 1', 'o'),
      Player.new('player 2', 'x')
    ]
  end

  def play
    loop do
      board.show
      turn(@players.first)
      break if board.game_over?

      @players.rotate!
    end
    game_over
  end

  def turn(player)
    loop do
      move = player_input(player)
      if board.valid_move?(move)
        board.add_move(move, player)
        break
      end
      print "Invalid move, try again\n"
    end
  end

  def player_input(player)
    print "#{player.name} (#{player.char}), enter your move: "
    gets.chomp
  end

  def game_over
    puts 'Game Over.'
    board.show
    if board.full?
      puts 'Tie.'
    else
      puts "#{board.winner.name} wins."
    end
  end
end
