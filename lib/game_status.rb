# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2], [3,4,5] ,[6,7,8],

  [0,3,6], [1,4,7] ,[2,5,8],
  
  [0,4,8], [2,4,6]
]

def won?(board)

     WIN_COMBINATIONS.detect do |wins|
      wins.all? {|letter| board[letter] == "X" }|| wins.all? {|letter| board[letter] == "O" }

end
end

def full?(board)
  board.all? do |value|
   value=="X"||value=="O"
end
end


def draw?(board)
  if !full?(board)|| won?(board)    
    return false
  elsif !won?(board)&& full?(board)
    return true
end
end

def over?(board)
if won?(board) || draw?(board)||full?(board)
  true
else 
  false
end
end

def winner(board)
  
 if won?(board)
  return board[won?(board)[0]]
else
  return nil
end
end




