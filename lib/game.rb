require './lib/board'
require './lib/turn'
require 'pry'



class Game
  def initialize
    @new_game = 'q'
  end

  def welcome
    p "Welcome to Connect Four!"
    p "Enter p to play. Enter q to quit."
  end

  def new_connect_four
    welcome
    @new_game = gets().chomp!
    if @new_game != 'p'
      p "Goodbye!"
      return
    end
    while @new_game == 'p'
      game_board = Board.new
      game_board.create_board
      turn = Turn.new(game_board)
      turn.row(6)
      turn.user_column(0)
      while !turn.win
        turn.input_column
        turn.place_piece
        turn.gameboard.display_board
        if turn.win
          break
        end
        turn.computer_place_piece
        turn.gameboard.display_board
      end
      turn.winner
        new_connect_four
    end
  end

end
