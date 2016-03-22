# Helper Method
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  [6,4,2]
]

# The variable "item" is going to give the array index.
def won?(board)
  WIN_COMBINATIONS.each do |item|
    win_index_1 = board[item[0]]
    win_index_2 = board[item[1]]
    win_index_3 = board[item[2]]

    if win_index_1 != " " && win_index_1 == win_index_2 && win_index_2 == win_index_3
      return item
    end
  end
  false
end

def full?(board)
  board.all? do |value|
    value == "X" || value == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if !won?(board)
    return nil
  elsif won?(board)
    won?(board).all? do |item|
      item == "X" || item == "O"
      token = board[item]
      return token
    end
  end
end


