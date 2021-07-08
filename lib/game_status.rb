# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Top L Diag
  [2,4,6], # Top R Diag
  [0,3,6], # L Column
  [1,4,7], # M Column
  [2,5,8]  # R Column
]



def won?(board)
    #won?(board) returns SUBARRAY for winner and FALSE for NO WINNER 
    
    #Check over board for winning combos, return winning array
    WIN_COMBINATIONS.each do |subArray|

        #Try an if all? loop here
        if board[subArray[0]] == "X" && board[subArray[1]] == "X" && board[subArray[2]] == "X" || board[subArray[0]] == "O" && board[subArray[1]] == "O" && board[subArray[2]] == "O"
          return subArray
        end
    end #win_combinations loop end

    return false
  end #<--------------------------- def won? end






def full?(board)
      #Returns TRUE for FULL and FALSE for in-progress
      #Count to see if board is full
      spots = 0
      board.each do |space|
        if space == "X" || space == "O" #if the space is X or O
          spots += 1
        end
      end #count spots loop end 

      if spots == 9 # Check for a full board
        return true
        else 
          return false 
      end #if spots end
  end #-------------------------- def full? end






def draw?(board)
  #Returns TRUE for DRAW and FALSE ELSE 

    #no winner                 is full 
  if won?(board) == false && full?(board) == true 
    return true #There is a draw

    #no winner                  #not full
  elsif won?(board) == false && full?(board) == false
    return false

    #Game is won - return false
  elsif won?(board) != false
    return false
  end
end # ------------------------------ def draw? end




def over?(board)
  #Someone won                or there is a draw        or the board is full
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true

    #no winner                no draw                 not full 
  elsif won?(board) == false && draw?(board) == false && full?(board) == false 
    return false
  end

end # --------------------------------- def over? end

def winner(board)
    count = 0
    if won?(board) != false
          until count > 0
            won?(board).each do |index|
            return board[index]
            end #each end
          end #Until end
    end #if end 
  return nil

end




