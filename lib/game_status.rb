# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #horizontal top row
  [3,4,5], #horizontal middle row
  [6,7,8], #horizontal bottom row
  [0,3,6], #vertical first column
  [1,4,7], #vertical second column
  [2,5,8], #vertical third column
  [0,4,8], #top left to bottom right diagnoal
  [2,4,6] #top right to bottom left diagnoal
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
        return win_combination
      end
  end
  board.each do |index|
    if index == " "
      return false
    else
      return false
    end
  end
end

def full?(board)
    if board.include? " "
      return false
    else
      return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
    if draw?(board) || won?(board) || full?(board)
      return true
    else
      return false
  end
end

def winner(board)
if winner = won?(board)
  if board[winner[0]] == "X"
    return "X"
  elsif board[winner[0]] == "O"
    return "O"
  end
else
  return nil
end
end
