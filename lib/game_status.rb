# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.detect do |position|
    ((board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X") || (board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"))
  
  end 
end

def full?(board)
  board.none?{|position| position == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  winner = won?(board)
    if !won?(board)
    nil
    else
    board[winner[0]] 
  end
end

    
    
