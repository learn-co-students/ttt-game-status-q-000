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

## count how many spaces are taken
def won?(board)
  win_set = nil
  win_set = WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
  end
   if win_set == nil
    win_set = WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
    end
  end
  return win_set
end

def full?(board)
  counter = 0
  9.times do |index|
    if position_taken?(board,index)
      counter +=1
    end
  end
  return counter == 9
end

def draw?(board)
  return full?(board) && won?(board) == nil
end

def over?(board)
  return draw?(board) || won?(board) != nil
end

def winner(board)
  win_X = WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
  end
  win_Y = WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
  end
  if win_X != nil
    return "X"
  end
  if win_Y != nil
    return "O"
  end
  return nil
end
