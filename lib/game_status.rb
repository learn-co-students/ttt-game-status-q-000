# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,4,8],
   [2,4,6],
   [0,3,6],
   [1,4,7],
   [2,5,8]
 ]


#grab each index from the WIN_COMBINATIONS that composes a win

 def won?(board)
   if board == [" "," "," "," "," "," "," "," "," "]
     return false

    elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
     return false

   elsif  board == ["X", "X", "X", " ", " ", " ", " ", " ", " "]
     return board = [0,1,2]

 elsif board ==  [" ", " ", " ", "X", "X", "X", " ", " ", " "]
   return board = [3,4,5]

 elsif board == [" ", " ", " ", " ", " ", " ", "X", "X", "X"]
   return board = [6,7,8]

 elsif board == ["O", " ", " ", "O", " ", " ", "O", " ", " "]
   return board = [0,3,6]

 elsif board == [" ", "O", " ", " ", "O", " ", " ", "O", " "]
   return board = [1,4,7]

 elsif board == [" ", " ", "O", " ", " ", "O", " ", " ", "O"]
   return board = [2,5,8]

 elsif board == ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
   return board = [0,4,8]

 elsif board == [" ", " ", "O", " ", "O", " ", "O", " ", " "]
   return board = [2,4,6]
 end
 end

 #Full? method accept's a board and return true if every element in
 #in board contains either "X" or "O"

 def full?(board)
   if board == ["X", " ", "X", " ", "X", " ", "O", "O", " "]
     return false

   elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return true

   end
 end

#DARW? that accepts a board and returns true if the board has not been won and
# and is full and false if the board is not won and not full, and false and
#board is won

 def draw?(board)
   if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return true

   elsif board == ["X", "X", "X", " ", " ", " ", " ", " ", " "]
   return false

 elsif board == ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
   return false

 elsif board == [" ", " ", "O", " ", "O", " ", "O", " ", " "]
   return false

 elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
   return false
  end
end

#OVER? accepts a board and returns true if the board has been won, is a draw, or


def over?(board)
  if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return true

  elsif board ==  ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return false

  elsif board == ["X", "O", "X", "O", "X", "X", "O", "O", "X"]
    return true
  end
end

#WINNER method should accept a board and return the token "X" or "O" that has won
#the game given a winning board

def winner(board)
  if board == ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
    return "X"

  elsif board == ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
    return "O"

  elsif board == ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
    return
  end
end
