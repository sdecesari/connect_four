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

end
