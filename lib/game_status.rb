# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      win_combination
      true
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      win_combination
      true
    else
      false
    end
  end
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end

end

def draw?(board)
  if !won?(board) && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

def winner(board)
  WIN_COMBINATIONS.find do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return "X"
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return "O"
    else
      nil
    end
  end
end
# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal
  [2,4,6] #diagonal
]
