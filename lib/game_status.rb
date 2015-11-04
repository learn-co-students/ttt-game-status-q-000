# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column

  [0,4,8], #diagonal1
  [2,4,6], #diagonal2
]

#won?
def won?(board)
  topRowWin = WIN_COMBINATIONS[0]
  midRowWin = WIN_COMBINATIONS[1]
  bttmRowWin = WIN_COMBINATIONS[2]
  leftWin = WIN_COMBINATIONS[3]
  midWin = WIN_COMBINATIONS[4]
  rightWin = WIN_COMBINATIONS[5]
  diag1Win = WIN_COMBINATIONS[6]
  diag2Win = WIN_COMBINATIONS[7]

  if board[topRowWin[0]] == "X" && board[topRowWin[1]] == "X" && board[topRowWin[2]] == "X"
    return topRowWin
  elsif board[midRowWin[0]] == "X" && board[midRowWin[1]] == "X" && board[midRowWin[2]] == "X"
    return midRowWin
  elsif board[bttmRowWin[0]] == "X" && board[bttmRowWin[1]] == "X" && board[bttmRowWin[2]] == "X"
    return bttmRowWin
  elsif board[leftWin[0]] == "O" && board[leftWin[1]] == "O" && board[leftWin[2]] == "O"
    return leftWin
  elsif board[rightWin[0]] == "O" && board[rightWin[1]] == "O" && board[rightWin[2]] == "O"
    return rightWin
  elsif board[rightWin[0]] == "O" && board[rightWin[1]] == "O" && board[rightWin[2]] == "O"
    return rightWin
  elsif board[midWin[0]] == "O" && board[midWin[1]] == "O" && board[midWin[2]] == "O"
    return midWin
  elsif board[diag1Win[0]] == "X" && board[diag1Win[1]] == "X" && board[diag1Win[2]] == "X"
    return diag1Win
  elsif board[diag2Win[0]] == "O" && board[diag2Win[1]] == "O" && board[diag2Win[2]] == "O"
    return diag2Win
  else 
    return nil
  end
end

#full?
def full?(board)

  board.any? do | position |
    if position =="" || position ==" " || position ==nil
      return false
    end
  end

  board.all? do | position |
    if position !="" || position !=" "
      return true
    end
  end
end

#draw?
def draw?(board)
  testWin = won?(board)
  test = full?(board)

  WIN_COMBINATIONS.each do | combo |
    if testWin == combo
      return false
    end
  end

  if test == true
    return true
  end
end

#over?
def over?(board)
  test = draw?(board)
  testWin = won?(board)

  WIN_COMBINATIONS.each do | combo |
    if testWin == combo
      return true
    end
  end

  if test == true
    return true
  end
end

#winner
def winner(board)
  testWin = won?(board)
  if testWin == nil
    return nil
  end

  testWin.each do | pos |
    if board[pos] == "X"
      return "X"
    elsif board[pos] == "O"
      return "O"
    end
  end
end
