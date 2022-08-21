require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :players

  def initialize
    @board = Board.new
    @players = [
      Player.new('Player 1', 'x'),
      Player.new('Player 2', 'o')
    ]
  end

  def play
    loop do
      board.show
      turn(board, players.first)
      break if board.gameover?

      players.rotate!
    end
    board.show
    game_over
  end

  def game_over
    puts 'GAME OVER'
    if board.winner == 'tie'
      puts "It's a tie"
    else
      puts "Winner: #{players.first.name}"
    end
  end

  def turn(board, player)
    loop do
      move = player.get_input
      if board.valid_move? move
        board.add_move(move, player.char)
        break
      else
        print "Invalid move, try again\n"
      end
    end
  end
end
