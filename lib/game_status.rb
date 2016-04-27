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
[6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    
  $position_1 = board[win_combination[0]] 
  $position_2 = board[win_combination[1]] 
  $position_3 = board[win_combination[2]] 

  if $position_1 == "X" && $position_2 == "X" && $position_3 == "X" || 
    $position_1 == "O" && $position_2 == "O" && $position_3 == "O" 

    return win_combination # return the win_combination indexes that won.
  
  else
    false
end
end
end

def full?(board)
  board.each do |q|
    if q == "X" || q == "O" || q == "x" || q == "o" 
      true
    else
      return false
    end
  end
end

def draw?(board)
if full?(board) && !won?(board)
  return true
else
  false
end
end 

def over?(board)
if full?(board) || won?(board) || draw?(board)
  return true
else
  return false
end
end

def winner(board)
if won?(board) && $position_1 == "X"
  return "X"
elsif won?(board) && $position_1 == "O"
  return "O"
else
  return nil
end
end


