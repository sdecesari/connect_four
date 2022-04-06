class Board
  attr_reader :board
  def initialize
    @board = board

  end

  def create_board
  @board = Array.new(6) {Array.new(7) {"."}}
    @board.unshift([*('A'..'G')])
  end

  def display_board
    @board.each do |line|
      puts line.join("")
    end
  end
end 
