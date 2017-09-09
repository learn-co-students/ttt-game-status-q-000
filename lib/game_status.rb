# Helper Method

def position_taken?(board, index)
  !board[index].nil? && board[index] != " " && board[index]!=""
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def full?(board)
  board.none?{|i| i==" " || i=="" }
end

def draw?(board)
  winner(board) == nil &&  full?(board)
end

def over?(board)
  (winner(board)!=nil || full?(board) || draw?(board))? true : false
end

def won?(board)
  #puts WIN_COMBINATIONS[1][0]+", "+WIN_COMBINATIONS[1][1]]+", "+WIN_COMBINATIONS[1][2]]
  for i in 0..WIN_COMBINATIONS.size-1 do
    if board[WIN_COMBINATIONS[i][0]] == board[WIN_COMBINATIONS[i][1]] &&
      board[WIN_COMBINATIONS[i][0]] == board[WIN_COMBINATIONS[i][2]] &&
      position_taken?(board, WIN_COMBINATIONS[i][0])
          return [WIN_COMBINATIONS[i][0],WIN_COMBINATIONS[i][1],WIN_COMBINATIONS[i][2]]
    end
  end
 return false
end

def winner(board)
  result = won?(board)
  if result != false && result != nil
    return board[result[0]]
  end
  nil
end
