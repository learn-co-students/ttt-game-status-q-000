# Helper Method
require 'pry'

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

# board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
def won?(board)

   WIN_COMBINATIONS.each do |combo|

    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]

    if 
      board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X" 
      return combo
    end

    if 
      board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O" 
      return combo
    end
  end
  false
end




def full?(board)
  outcome = false 
  board.each do |value| 
    if (value == "O" || value == "X")
      outcome = true 
    else return false
    end
  end
  return outcome 
end


def draw?(board)
  outcome = false
  if (full?(board) == true && won?(board) == false)
  outcome = true
  else
  outcome = false
end
outcome
end


def over?(board)
  outcome = false
  if (full?(board) == true || draw?(board) == true)
    outcome = true
  end
end



# def winner(board)
#   if won?(board) 
#     return "X"

#   else
#     return nil
#   end
# end


def winner(board)
  
  winning_combo = won?(board)

  if winning_combo != false

    return board[winning_combo[0]]
  
  else
    
    return nil
  
  end

end



