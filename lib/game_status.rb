# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], #top row
[3,4,5], #middle row
[6,7,8], #bottom row
[0,3,6], #left column
[1,4,7], #middle column
[2,5,8], #right column
[0,4,8], #left to right diagonal
[2,4,6], #right to left diagonal
]

def won?(board)
WIN_COMBINATIONS.detect do |win_combination|
  position_taken?(board, win_combination[0]) && board[win_combination[0]] == 
    board[win_combination[1]] && board[win_combination[1]] == 
      board[win_combination[2]]
  end
end 

def full?(board)
  board.all? do |board|
   position_taken?(board, board)
   end  
end


def draw?(board)
  if full?(board) == true && !won?(board) == true
    return true
  else return false
  end
end

def over?(board)
  if draw?(board) == true || !won?(board) == false
  return true
  else return false
  end
end 

def winner(board)
  #return who won- X or O/ return string x or o
  if win_array = won?(board) 
    return board[win_array[0]]
    else return nil
  end
end

