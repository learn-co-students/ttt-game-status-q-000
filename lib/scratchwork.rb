COMBOS = [
  topRowWin,
  midRowWin,
  bttmRowWin,
  leftWin,
  midWin,
  rightWin,
  diag1Win,
  diag2Win
  ]

  board.detect{|position| position.all}

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