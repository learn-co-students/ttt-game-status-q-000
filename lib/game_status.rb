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
  [2,4,6]
  ]


def won?(board)
  combination = []
  board.each do |i|
    combination << i
  end
  if combination[0] == "X" && combination[1] == "X" && combination[2] == "X"
    return WIN_COMBINATIONS[0]
  elsif combination[3] == "X" && combination[4] == "X" && combination[5] == "X"
    return WIN_COMBINATIONS[1]
  elsif combination[6] == "X" && combination[7] == "X" && combination[8] == "X"
    return WIN_COMBINATIONS[2]
  elsif combination[0] == "O" && combination[3] == "O" && combination[6] == "O"
    return WIN_COMBINATIONS[3]
  elsif combination[1] == "O" && combination[4] == "O" && combination[7] == "O"
    return WIN_COMBINATIONS[4]
  elsif combination[2] == "O" && combination[5] == "O" && combination[8] == "O"
    return WIN_COMBINATIONS[5]
  elsif combination[0] == "X" && combination[4] == "X" && combination[8] == "X"
    return WIN_COMBINATIONS[6]
  elsif combination[2] == "O" && combination[4] == "O" && combination[6] == "O"
    return WIN_COMBINATIONS[7]  
    return false
  end
end

def full?(board)
  if board.include?(" ") || board.include?("")
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  combination = []
  board.each do |i|
    combination << i
  end
  if combination[0] == "X" && combination[4] == "X" && combination[8] == "X"
    return "X"
  elsif combination[1] == "O" && combination[4] == "O" && combination[7] == "O"
    return "O"
  else
    return nil
  end
end