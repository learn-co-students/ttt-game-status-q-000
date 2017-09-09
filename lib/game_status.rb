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
  WIN_COMBINATIONS.find do |combination|
    first = combination[0]
    second = combination[1]
    third = combination[2]
    board[first] == board[second] && board[second] == board[third] && board[first] != " "

  end
end

def full?(board)
  board.none? do |item|
    item == " "
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  win_combination = won?(board)
  return nil if win_combination == nil
  return board[win_combination[0]]
end






