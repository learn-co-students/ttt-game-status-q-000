# Helper Method
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
  [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if
      (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]) && (board[combo[0]] == "X" || board[combo[0]] == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  #wasn't getting .any to work, come back to this?
  board.each do |spot|
    if spot == " "
      return false
    end
  end
    return true
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
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  #is this too hard coded?
  if won?(board) == false
    return nil
  else
  winning_player = won?(board)
  return board[winning_player[0]]
  end
end
