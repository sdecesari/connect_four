require 'pry'
class Board
  attr_reader :height, :column, :board
  def initialize(height, column)
    @height = height
    @column = column
    @board = board

  end

  def create_board
    board = Array.new(@height) {Array.new(@column) {"."}} #why is array capitalized
      board.unshift(["ABCDEFG"])
    board
  end

  def display_board
    create_board.each do |line|
      puts line.join("")
    end
  end

end

p "Welcome to Connect Four!"
game_board = Board.new(7,7)
game_board.create_board
game_board.display_board
