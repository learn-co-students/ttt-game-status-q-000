# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_index|
    board[win_index[0]] == board[win_index[1]] &&
    board[win_index[1]] == board[win_index[2]] &&
    position_taken?(board, win_index[0])
  end
end

def full?(board)
  board.all? do |taken|
    taken=="X" || taken=="O"
  end
end

def draw?(board)
  if won?(board)
    return false
   else full?(board)
    return true
 end
end

def over?(board)
  if won?(board) || full?(board) 
    return true
  end
end

def winner(board)

  if won?(board) 
    board[won?(board)[0]]
  end
end









