# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def draw? board
if (full?(board) && !won?(board))
  return true
end
return false
end

def full? board
  board.each_with_index do |element, index|
    if !position_taken?(board, index)
      return false
    end
  end
  return true
end

def over? board
  if draw?(board) || won?(board)
    return true
  end
  return false
end

def winner board
  winning_combination = won?(board)
  if winning_combination
    return board[winning_combination[0]]
  end
end

def won? board
  WIN_COMBINATIONS.each do |combination|
    if position_taken?(board, combination[0]) && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
      return combination
    end
  end
  return false
end
