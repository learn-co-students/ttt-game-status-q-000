# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  if full?(board)#If full? is true
      WIN_COMBINATIONS.each do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
       
        position_1 = board[win_index_1] # load the value of the board at win_index_1
        position_2 = board[win_index_2] # load the value of the board at win_index_2
        position_3 = board[win_index_3] # load the value of the board at win_index_3

        if (position_1 == "X" && position_2 == "X" && position_3 = "X")
          return win_combination # return the win_combination indexes that won.
        elsif (position_1 == "O" && position_2 == "O" && position_3 = "O")
          return win_combination
        else
          false
        end
      end
  else #If full? is false, return false
    false
  end
end

def full?(board) 
#If none of space on board == " ", board is full
board.none? { |space| space == " " }
end

def draw?(board)
  if (full?(board) == true) && (won?(board) == false)
    #If full? is true AND won? is false, game is draw
    true
  elsif (full?(board) == false)
    #If full? is false, game is not over
    false
  else #If full? is true, but won? is true, Game won
    false
  end
end

def over?(board)
  if full?(board) #If full? is true, game is over
    true
  else #If full? is false, game is not over
    false
  end
end

def winner(board)

  if won?(board) && position_1 == "X"
    "X"
  elsif won?(board) && position_1 == "O"
    "O"
  else
    nil
  end

end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [

  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row

  [0, 3, 6], # Col 1
  [1, 4, 7], # Col 2
  [2, 5, 8], # Col 3

  [0, 4, 8], # Diag 1
  [2, 4, 6]  # Diag 2

]
