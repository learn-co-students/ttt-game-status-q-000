# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]

]
win_symbol="X"
def won?(board)
board.all?{|p| p!=""||p!=" "}
count=0

while count<WIN_COMBINATIONS.length
  winner1 =  WIN_COMBINATIONS[count].all?{|c| board[c] == "X"}
  winner2 = WIN_COMBINATIONS[count].all?{|c| board[c] == "O"}
  if winner1==true||winner2==true
          return  WIN_COMBINATIONS[count]
  else
    false
end
count+=1
end
end

def full?(board)
  board.all?{|el| el=="X"||el=="O"}
end

def draw?(board)
  if(!won?(board)&&full?(board))
 return true
else
  return false
end
if(!won?(board)&&!full?(board)||won?(board))
  return false
end
end

def over?(board)
  won?(board)||draw?(board)||full?(board)
end


def winner(board)
count=0
w1=0
w2=0
if(!won?(board))
  return nil
end

while count<board.length
  if(board[count]=="X")
    w1+=1
  elsif(board[count]=="O")
    w2+=1
end
count+=1
end
if(w1>w2)
  return "X"
else
  return "O"
end

end
