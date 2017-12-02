


# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
WIN_COMBINATIONS.each do |win_combination|  
    
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3


  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination # return the win_combination indexes that won.        
  else
    false
end
end
if 
  position_taken?(board, 0) &&
  position_taken?(board, 1) &&
  position_taken?(board, 2) &&
  position_taken?(board, 3) &&
  position_taken?(board, 4) &&
  position_taken?(board, 5) &&
  position_taken?(board, 6) &&
  position_taken?(board, 7) &&
  position_taken?(board, 8) &&
  position_taken?(board, 9) &&
  false
end

end


def full?(board)
  !board.include?(" ")
end


def draw?(board)
  if !full?(board) || won?(board)
    false
  else
    true
end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
end
end

def winner(board)

if won?(board)

  WIN_COMBINATIONS.each do |win_combination|  
    
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3


  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X" # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O" # return the win_combination indexes that won.        
  else
    false
  end
end

else
  nil
end

end













