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
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    pos_1 = combination[0]
    pos_2 = combination[1]
    pos_3 = combination[2]

    if board[pos_1] == "X" && board[pos_2] == "X" && board[pos_3] == "X"
      return combination
    elsif board[pos_1] == "O" && board[pos_2] == "O" && board[pos_3] == "O"
      return combination
    end 
  end
  return false
end

def full?(board)
  result = board.detect{|pos| pos == " "}
  if result == " "
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
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
  if winning_combination = won?(board)
    if board[winning_combination[0]] == "X"
      return "X"
    elsif board[winning_combination[0]] == "O"
      return "O"
    end
  else
    return nil
  end
end