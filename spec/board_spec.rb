require 'rspec'
require './lib/board'

RSpec.describe Board do
  it "exists" do
    game_board = Board.new
    expect(game_board).to be_an_instance_of(Board)
  end

  it "creates board" do
    game_board = Board.new
    game_board.create_board
    expect(game_board.board.length).to eq(7)
    expect(game_board.board[0].length).to eq(7)
  end

  it "display_board" do
    game_board = Board.new
    game_board.create_board
    expect(game_board.display_board).to eq(game_board.board)
  end

end
