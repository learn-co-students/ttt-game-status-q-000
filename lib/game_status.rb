# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], #top row
                     [3,4,5], #middle row
                     [6,7,8], #bottom row
                     [0,3,6], #left column
                     [1,4,7], #center column
                     [2,5,8], #right column
                     [0,4,8], #left diagonal
                     [2,4,6]  #right diagonal
                   ]


def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O") then
         return win_combination

      end
    end
  false
  end

def full?(board)
  if position_taken?(board,0) == true &&
     position_taken?(board,1) == true &&
     position_taken?(board,2) == true &&
     position_taken?(board,3) == true &&
     position_taken?(board,4) == true &&
     position_taken?(board,5) == true &&
     position_taken?(board,6) == true &&
     position_taken?(board,7) == true &&
     position_taken?(board,8) == true then
     true
  else
    false
  end
end

def draw?(board)
  #true if full and not won
  if (full?(board) == true && won?(board) == false) then
    true
  else
    false
  end
end

def over?(board)
  if (full?(board) == true || draw?(board) == true || won?(board) != false) then
    true
  end
end

def winner(board)
  if won?(board) != false then
  WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O") then
         return position_1

      end
    end
  end

end
  

