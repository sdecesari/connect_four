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

  xit 'can input a column' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    turn.input_column

    expect(turn.input_column).to eq(2)
  end

  it 'has a valid column' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    expect(turn.valid_column?).to eq true

    turn.place_piece
    turn.place_piece
    turn.place_piece
    turn.place_piece
    turn.place_piece
    turn.place_piece

    expect(turn.valid_column?).to eq false
  end

  xit 'has a row' do
    turn = Turn.new
    game_board.create_board
    game_board = Board.new

    turn.input_column
    turn.get_row

    expect(turn.get_row).to eq(6)
  end

  it 'can place a piece' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    expect(turn.place_piece).to eq('X')
  end

  it 'computer can place a piece' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    expect(turn.computer_place_piece).to eq('O')
  end

  it 'game is a draw' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    expect(turn.draw?).to eq false
  end
end
