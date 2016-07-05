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
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |win_index|
    if board[win_index[0]] != " " && board[win_index[0]] == board[win_index[1]] && board[win_index[1]] == board[win_index[2]]
      return win_index
    end
  end
  return false
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) == true
    return true
  elsif full?(board) == true
    return true
  end
end

def winner(board)
  if win = won?(board)
    board[win.first]
  end
end
