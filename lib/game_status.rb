# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #TOP ROW
  [3,4,5], #MIDDLE ROW
  [6,7,8], #BOTTOM ROW
  [0,3,6], #FIRST COLUMN
  [1,4,7], #MIDDLE COLUMN
  [2,5,8], #LAST COLUM
  [0,4,8], #0 DIAGONAL
  [2,4,6]  #2 DIAGONAL
  ]

def won?(board)
  WIN_COMBINATIONS.find do |win_comb|
  position_taken?(board, win_comb[0]) &&
    board[win_comb[0]] == board[win_comb[1]] && board[win_comb[0]] == board[win_comb[2]]
  end
end

def full?(board)
  board.all?{|spot| !(spot.nil? || spot == " ")}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if win = (won?(board))
    board[win[0]]
  end
end