require 'rspec'
require './lib/board'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  it "exists" do
    game_board = Board.new
    turn = Turn.new(game_board)

    expect(turn).to be_an_instance_of(Turn)
  end

  it 'can input a column' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    turn.input_column

    expect(turn.input_column).to eq(2)
  end

end
