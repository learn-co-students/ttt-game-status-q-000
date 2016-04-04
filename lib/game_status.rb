# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

 WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # mid row
  [6,7,8], # bot row
  [0,3,6], # left col
  [1,4,7], # mid col
  [2,5,8], # right col
  [0,4,8], # diag to right
  [6,4,2]  # diag to left
  ]




def won?(board)
  WIN_COMBINATIONS.each do |combo|
  position_1 = combo[0]
  position_2 = combo[1]
  position_3 = combo[2]
      if position_taken?(combo, board)
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      combo
        elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      combo
        else
        false
    end
    end
   false
  end
end
