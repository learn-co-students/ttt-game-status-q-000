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
  if(won?(board)==false&&full?(board)==true)
 true
end
if(won?(board)==false&&full?(board)==false)
  false
end
if(won?(board)!=false)
  false
end
end

def over?(board)
  if(won?(board)!=false||draw?(board)==true||full?(board)==true)
true
    end
end
def winner(board)
end
