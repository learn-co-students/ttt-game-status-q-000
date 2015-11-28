
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #first column
  [1, 4, 7], #second column
  [2, 5, 8], #third column
  [0, 4, 8], #first diagonal
  [2, 4, 6]  #second diagonal
]

def won?(board)
   WIN_COMBINATIONS.detect do |numbers|
     if numbers.all? { |position| board[position] == "X"  }
      return numbers
     elsif numbers.all? { |position| board[position] == "O"  }
      return numbers
     else
      false
     end
  end
end

def full?(board)
  board.all? { |position| position == "X" || position == "O" }
end

def draw?(board)
if won?(board)
  return false
else
  board.all? do |position|
      position == "X" || position == "O"
   end
 end 
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]] == "X"
      return "X"
      else 
      return "O"
    end
    else draw?(board)
        return nil
    end
  end







