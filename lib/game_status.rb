# Helper Method
def won? (board)
 WIN_COMBINATIONS.each do |win_combination|
      if board [win_combination[0]] == "X" && board [win_combination[1]] == "X" && board [win_combination[2]] == "X"
       return win_combination
      elsif board [win_combination[0]] == "O" && board [win_combination[1]] == "O" && board [win_combination[2]] == "O"
        return win_combination
      else
     end
  end
  false
end

def full?(board)
  board.all? do |taken|
    if taken == "X" || taken == "O"
       true
    else
       false
    end 
    end
end

def draw? (board)
  if full?(board) == true && won?(board) == false
     true
  else
     false
  end
end

def over? (board)
  if full?(board)
     true
  else
     false
  end
end 

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
       if board [win_combination[0]] == "X" && board [win_combination[1]] == "X" && board [win_combination[2]] == "X"
        return "X"
       elsif board [win_combination[0]] == "O" && board [win_combination[1]] == "O" && board [win_combination[2]] == "O"
         return "O"
       else
         
      end
   end
   nil
end
    

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]
