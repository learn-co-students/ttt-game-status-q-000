# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

#this is a Constant
WIN_COMBINATIONS = [
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

  WIN_COMBINATIONS.each do |winning_combo|
    if (board[winning_combo[0]] == "X" && board[winning_combo[1]] == "X" && board[winning_combo[2]] == "X") || (board[winning_combo[0]] == "O" && board[winning_combo[1]] == "O" && board[winning_combo[2]] == "O")
      return winning_combo
    end
  end
  nil
end


def full?(board)

  board.each do |position|
    if (position == "X" || position == "O")
    else
      return false
    end
  end
end


def draw?(board)
    full?(board) && !won?(board)
end



def over?(board)

#returns TRUE if: won? || draw? || full?
  won?(board) || draw?(board) || full?(board)

end


def winner(board)

#first need to define winning_combo as above it is only a local variable
  winning_combo = won?(board)

 #now, if there is a winner, return the token 
  if winning_combo
    return board[winning_combo[0]]  #need to use "board" here because it is the varaible defined 
                                    #in the method: winner(board)

#if no winner, => nil    
    else
      nil
    end


end









