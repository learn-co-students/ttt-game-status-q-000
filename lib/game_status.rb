# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row

  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Third column

  [0,4,8],  # First Diagonal
  [2,4,6]  # Second Diagonal
]

def won?(board)

  board.any?{|cell| cell == " "}

  WIN_COMBINATIONS.each do |combination|
    if position_taken?(board, combination[0]) && position_taken?(board, combination[1]) && position_taken?(board, combination[2])
      if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && board[combination[0]] == board[combination[2]]
        return combination
      end
    end
  end

  return false

end

def full?(board)
  if won?(board) == false && !board.any?{|cell| cell == " "}
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board)
    true
  else
    false
  end

end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end


