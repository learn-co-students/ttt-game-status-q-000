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

  i = 0
  while i < 3
    if board[WIN_COMBINATIONS[i][0]] == "X" && board[WIN_COMBINATIONS[i][1]] == "X" && board[WIN_COMBINATIONS[i][2]] == "X"
      return WIN_COMBINATIONS[i]
    elsif board[WIN_COMBINATIONS[i][0]] == "O" && board[WIN_COMBINATIONS[i][1]] == "O" && board[WIN_COMBINATIONS[i][2]] == "O"
      return WIN_COMBINATIONS[i]
    end
    i += 1
  end

  i = 3
  while i < 6
    if board[WIN_COMBINATIONS[i][0]] == "X" && board[WIN_COMBINATIONS[i][1]] == "X" && board[WIN_COMBINATIONS[i][2]] == "X"
      return WIN_COMBINATIONS[i]
    elsif board[WIN_COMBINATIONS[i][0]] == "O" && board[WIN_COMBINATIONS[i][1]] == "O" && board[WIN_COMBINATIONS[i][2]] == "O"
      return WIN_COMBINATIONS[i]
    end
    i += 1
  end

  if board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X"
    return WIN_COMBINATIONS[6]
  elsif board[WIN_COMBINATIONS[6][0]] == "O" && board[WIN_COMBINATIONS[6][1]] == "O" && board[WIN_COMBINATIONS[6][2]] == "O"
    return WIN_COMBINATIONS[6]
    
  end

  if board[WIN_COMBINATIONS[7][0]] == "X" && board[WIN_COMBINATIONS[7][1]] == "X" && board[WIN_COMBINATIONS[7][2]] == "X"
    return WIN_COMBINATIONS[7]
  elsif board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O"
    return WIN_COMBINATIONS[7]
  end

  return false
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]] == "X"
      return "X"
    elsif board[won?(board)[0]] == "O"
      return "O"
    end
  else
    return nil
  end
end