require_relative 'tic_tac_toe'
class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @players = %w[x o]
  end

  def play
    board = Board.new
    player_number = 2
    until board.gameover?
      player_number = player_number == 1 ? 2 : 1
      turn(board, player_number)
    end
    puts "GAME OVER"
    if board.winner == 'tie'
      puts "It's a tie"
    else
      puts "Winner: player #{player_number}"
    end
  end

  def turn(board, player_number)
    char  = player_number == 1 ? 'x' : 'o'
    print "Player #{player_number} (#{char}), enter your move: "
    loop do
      move = gets.chomp
      if board.valid_move? move
        board.add_move(move,char)
        break
      else
        print "Invalid move, try again "
      end
    end
  end
end
