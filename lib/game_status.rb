# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right Diagonal
]

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
     return win_combination
      # return the win_combination indexes that won.
   end
  end
   if (board[0] = " " && board[1] =" " && board[2] =" " && board[3] =" " && board[4] =" " && board[5] =" " && board[6] =" " && board[7] =" " && board[8] =" " )
  false
  end
end

def full?(board)
   if board.any?{|i| i == " "}
    false
  else
  if draw?(board)
    true
  end
  end
end

def draw?(board)
  if won?(board)
    false
  else
    true
  end
end

def over?(board)
  if board.any?{|i| i == " "}
    false
  else
  if draw?(board)
    true
  elsif won?(board)
    true
  end
  end
end

def winner(board)
   winning_board = won?(board)
   if won?(board)
     if board[winning_board[0]] == "X"
       "X"
     else board[winning_board[0]]== "O"
       "O"
     end
   else
     nil
   end

end
