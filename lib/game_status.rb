# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
WIN_COMBINATIONS.detect do |arr| 
  if board[arr[0]] == "X" && board[arr[1]] == "X" && board[arr[2]] == "X"
    arr
  elsif board[arr[0]] == "O" && board[arr[1]] == "O" && board[arr[2]] == "O"
    arr
  else
    false
  end
end 
end

def full?(board)
  board.all? do |item|
  item == "X" || item == "O"
end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  else won?(board)
    false
  end
end 

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
 if answer = won?(board)
  board[answer.first]
 else
  nil
 end
end 