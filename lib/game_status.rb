# Helper Method
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def position_taken?(board, location)
 !(board[location].nil?) && !(board[location] == " ")
end

puts position_taken?(board,4)
puts board[0] == board[1]
puts (((board[0] == board[1]) && (board[1] == board[2])) && (position_taken?(board, 0)))

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row 
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8], # Third Column 
  [0,4,8], # First Diagonal 
  [2,4,6]  # Second Diagonal
]

def won?(board) 
WIN_COMBINATIONS.each do |combination| 
  pos1 = board[combination[0]]
  pos2 = board[combination[1]]
  pos3 = board[combination[2]]

 if (((pos1 == pos2) && (pos2 == pos3)) && (position_taken?(board, combination[0])))
  return combination
else
  false
end
end 
end

def full?(board)
  board.each do |value| 
    if (value == "O" || value == "X")
      true
    else 
      break false
    end
  end
end


def draw?(board)
  if (won?(board) == false && full?(board) == true) 
    true
  else 
    false
  end
end 


#takes in a board and returns 
def over?(board) 
  if (won?(board) == true || full?(board) == true)
    true
  else 
    false
  end
end 

def winner(board)
  if won?(board) == false 


