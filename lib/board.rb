class Board
  attr_reader :height, :column
  def initialize(height, column)
    @height = height
    @column = column

  end

  def create_board
    board = []
    @column.times do
      board << Array.new[][]
    end
    board
  end

end
