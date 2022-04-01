class Turn
  attr_reader :gameboard, :user_column

  def initialize(gameboard)
    @gameboard = gameboard
    @board_hash = { A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G:6 }
    @user_column = 0
  end

  def input_column
    p "input a column A-G"
    letter_column = gets().chomp!.to_sym
    @user_column = @board_hash[letter_column]
  end

  def valid_column?
    x = 6
    while @gameboard.board[x][@user_column] == 'X' || @gameboard.board[x][@user_column] == 'O'
      if x == 1
        return false
        break
      end
      x -= 1
    end
    true
  end

  def get_row
    if valid_column?
      row = 6
      while @gameboard.board[row][@user_column] == 'X' || @gameboard.board[row][@user_column] == 'O'
        row -= 1
      end
    else
      input_column
    end
    row
  end

  def place_piece
      @gameboard.board[get_row][@user_column] = 'X'
  end

  def computer_place_piece
      @gameboard.board[get_row][@user_column] = 'O'
  end
end
