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
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  p1 = board[win_index_1] # load the value of the board at win_index_1
  p2 = board[win_index_2] # load the value of the board at win_index_2
  p3 = board[win_index_3] # load the value of the board at win_index_3

    if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
      return win_combination # return the win_combination indexes that won.
  end
end
  return false
end


def full?(board)
board.all? do |space|
  space == "X" || space == "O"
  end
end


def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else 
    false
  end
end


def winner(board)
  win = won?(board)
    return board[win[0]] if win
end










