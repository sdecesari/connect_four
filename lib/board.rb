require 'pry'
class Board
  attr_reader :height, :column
  def initialize(height, column)
    @height = height
    @column = column

  end

  def create_board
    board = Array.new(@height) {Array.new(@column) {"."}}

    board
  end

  def display_board
    create_board.each do |line|
      puts line.join("")
    end
  end


end

print 'ABCDEFG'
game_board = Board.new(7,6)
game_board.create_board
game_board.display_board
