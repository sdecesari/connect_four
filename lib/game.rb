class Game
  def new_game(user_input)
    @new_game = user_input
  end

  def welcome
    p "Welcome to Connect Four!"
    p "Enter p to play. Enter q to quit."
  end

  def new_connect_four
    welcome
    @new_game = gets().chomp!.upcase
    if @new_game == 'Q'
      p "Goodbye!"
      return
    elsif @new_game == 'P'
      while @new_game == 'P'
        game_board = Board.new
        game_board.create_board
        game_board.display_board
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
    else
      new_connect_four
    end
  end
end
