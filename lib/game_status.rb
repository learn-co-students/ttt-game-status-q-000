# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #middle row win
  [6, 7, 8], #bottom row win
  [0, 3, 6], #top left-bottom win
  [1, 4, 7], #middle-bottom win
  [2, 5, 8], #top right-bottom win
  [0, 4, 8], #top left-bottom right win
  [2, 4, 6] #top right-bottom left win
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
      return win_combo
    end
  end
  return false
end

#ternary syntax
def full?(board)
  board.all? {|full| full != " "} ? true : false
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) == true
    return true
  else
    false
  end
end

def winner(board)
  return nil if !won?(board)

  position = won?(board)[0]
    if board[position] == "X"
      return "X"
    elsif board[position] == "O"
      return "O"
  end
end
