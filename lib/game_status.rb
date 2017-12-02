# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [

  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]

]

def won?(board)

  return false if board.include?("X") == false && board.include?("O") == false

  WIN_COMBINATIONS.each do |x|

    if board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X"
      return x
    elsif board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"
      return x
    end

  end

  return false

end


def full?(board)
  
  board.each do |x|
    if x == " "
      return false
    end
  end

  return true

end

def draw?(board)

  if won?(board) == false && full?(board)
    return true
  end

  return false

end

def over?(board)

  if draw?(board)
    return true
  elsif won?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end

end

def winner(board)

  if won?(board) == false
    return nil
  end


  winning_array = won?(board)

  return board[winning_array[0]]

end