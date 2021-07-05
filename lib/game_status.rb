# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |win_conbination|
    win_index_1 = win_conbination[0]
    win_index_2 = win_conbination[1]
    win_index_3 = win_conbination[2]
    board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && board[win_index_1] != " "
  end
end

def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_conbination = won?(board)
  if win_conbination != nil
    winning_location = win_conbination[0]
    board[winning_location]
  else
    nil
  end
end
