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
  [2,4,6],
  [0,4,8]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if  board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
     return combo
    else
    end
  end
  return false
end

def full?(board)
  board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board) ? true : false
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  combo = won?(board)
  if(!won?(board))
    return nil
  elsif  board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
    return "X"
  elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
    return "O"
  else
    return nil
  end
end