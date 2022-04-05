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

  it 'can place a piece' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    expect(turn.gameboard.board[6][3]).to eq('.')
    turn.gameboard.board[6][3] = 'X'
    expect(turn.gameboard.board[6][3]).to eq('X')
  end

  it 'computer can place a piece' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    expect(turn.gameboard.board[6][2]).to eq('.')
    turn.gameboard.board[6][2] = 'O'
    expect(turn.gameboard.board[6][2]).to eq('O')
  end

  it 'game is a draw' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)

    expect(turn.draw?).to eq false
  end

end
