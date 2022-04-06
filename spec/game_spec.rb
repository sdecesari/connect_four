require 'rspec'
require './lib/board'
require './lib/turn'
require './lib/game'
require 'pry'

RSpec.describe Game do
  it "exists" do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it "displays Main Menu" do
    game = Game.new
    expect(game.welcome).to eq("Enter p to play. Enter q to quit.")
  end

  it "doesn't start a new game" do
    game = Game.new
    game.new_game('q')
    game.new_connect_four
    expect(game.new_connect_four).to eq(nil)
  end


end
