class Turn
  attr_reader :gameboard, :user_column

  def initialize(gameboard)
    @gameboard = gameboard
    @board_hash = { A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G:6 }
    @user_column = 0
    @row = 0
  end

  def input_column
    if draw?
      p "The game is a Draw!"
    else
    p "input a column A-G"
    letter_column = gets().chomp!.to_sym
    @user_column = @board_hash[letter_column]
    end
  end

  def valid_column?
    if @gameboard.board[1][@user_column] == 'X' || @gameboard.board[1][@user_column] == 'O'
      false
    else
      true
    end
  end

  def get_row
    if valid_column?
      @row = 6
      while @gameboard.board[@row][@user_column] == 'X' || @gameboard.board[@row][@user_column] == 'O'
        @row -= 1
      end
    else
      input_column
    end
    @row
  end

  def place_piece
      @row = get_row
      @gameboard.board[@row][@user_column] = 'X'
  end

  def computer_place_piece
      @user_column = rand(7)
      @row = get_row
      @gameboard.board[@row][@user_column] = 'O'
  end

  def draw?
    if @gameboard.board[1].find {|spot| spot == '.'}
      return false
    else
      true
    end
  end

  def diagonal_right_win
    arr = []
    k = 0
    j = 1
    while (@row - k) >= 1 && @user_column + k <= 6
      arr << @gameboard.board[@row - k][@user_column + k]
      k += 1
    end
    while (@row + j) <= 6 && @user_column - j >= 0
      arr << @gameboard.board[@row + j][@user_column - j]
      j += 1
    end
    arr.find_all{|x| x == "X"}.length == 4 || arr.find_all{|o| o == "O"}.length == 4
  end

  def diagonal_left_win
    arr = []
    k = 0
    j = 1
    while (@row - k) >= 1 && @user_column - k >= 0
      arr << @gameboard.board[@row - k][@user_column - k]
      k += 1
    end
    while (@row + j) <= 6 && @user_column + j >= 0
      arr << @gameboard.board[@row + j][@user_column + j]
      j += 1
    end
    arr.find_all{|x| x == "X"}.length == 4 || arr.find_all{|o| o == "O"}.length == 4
  end
end
