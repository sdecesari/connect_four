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
    turn.row(6)
    turn.user_column(0)
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
    turn.gameboard.board[6][3] = 'X'
    expect(turn.gameboard.board[6][3]).to eq('X')
  end
  it 'computer can place a piece' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    turn.gameboard.board[6][2] = 'O'
    expect(turn.gameboard.board[6][2]).to eq('O')
  end
  it 'game is a draw' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    turn.gameboard.board[1][0] = 'O'
    turn.gameboard.board[1][1] = 'O'
    turn.gameboard.board[1][2] = 'O'
    turn.gameboard.board[1][3] = 'O'
    turn.gameboard.board[1][4] = 'O'
    turn.gameboard.board[1][5] = 'O'
    turn.gameboard.board[1][6] = 'O'
    expect(turn.draw?).to eq true
  end
  it 'has consective_pieces' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    love_array =['X', 'X', 'X', 'O', 'X']
    expect(turn.consective_pieces(love_array, 'X')).to eq 3
  end
  it 'has a diagonal_right_win' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    turn.row(6)
    turn.user_column(0)
    turn.gameboard.board[6][0] = 'O'
    turn.gameboard.board[5][1] = 'O'
    turn.gameboard.board[4][2] = 'O'
    turn.gameboard.board[3][3] = 'O'
    expect(turn.diagonal_right_win).to eq true
  end
  it 'has a diagonal_left_win' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    turn.row(6)
    turn.user_column(3)
    turn.gameboard.board[6][3] = 'O'
    turn.gameboard.board[5][2] = 'O'
    turn.gameboard.board[4][1] = 'O'
    turn.gameboard.board[3][0] = 'O'
    expect(turn.diagonal_left_win).to eq true
  end
  it 'has a horizontal_win' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    turn.row(6)
    turn.user_column(0)
    turn.gameboard.board[6][0] = 'O'
    turn.gameboard.board[6][1] = 'O'
    turn.gameboard.board[6][2] = 'O'
    turn.gameboard.board[6][3] = 'O'
    expect(turn.horizontal_win).to eq true
  end
  it 'has a vertical_win' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    turn.row(6)
    turn.user_column(0)
    turn.gameboard.board[6][0] = 'O'
    turn.gameboard.board[5][0] = 'O'
    turn.gameboard.board[4][0] = 'O'
    turn.gameboard.board[3][0] = 'O'
    expect(turn.vertical_win).to eq true
  end
  it 'has won' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    turn.row(6)
    turn.user_column(0)
    turn.gameboard.board[6][0] = 'O'
    turn.gameboard.board[5][0] = 'O'
    turn.gameboard.board[4][0] = 'O'
    turn.gameboard.board[3][0] = 'O'
    expect(turn.win).to eq true
  end
  it 'has a winner' do
    game_board = Board.new
    game_board.create_board
    turn = Turn.new(game_board)
    turn.row(6)
    turn.user_column(0)
    turn.gameboard.board[6][0] = 'O'
    turn.gameboard.board[5][0] = 'O'
    turn.gameboard.board[4][0] = 'O'
    turn.gameboard.board[3][0] = 'O'
    expect(turn.winner).to eq("Computer wins!")
  end
end
