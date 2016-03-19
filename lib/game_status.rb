# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #across top
  [3,4,5], #across mid
  [6,7,8], #across bottom
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal1
  [2,4,6], #diagonal2
]

#won?
def won?(board)
  if
    board[WIN_COMBINATIONS[0][0]].include?("X") && board[WIN_COMBINATIONS[0][1]].include?("X") && board[WIN_COMBINATIONS[0][2]].include?("X") 
    return WIN_COMBINATIONS[0] #top row win
  elsif   
    board[WIN_COMBINATIONS[1][0]].include?("X") && board[WIN_COMBINATIONS[1][1]].include?("X") && board[WIN_COMBINATIONS[1][2]].include?("X")
    return WIN_COMBINATIONS[1] #middle row win
  elsif   
    board[WIN_COMBINATIONS[2][0]].include?("X") && board[WIN_COMBINATIONS[2][1]].include?("X") && board[WIN_COMBINATIONS[2][2]].include?("X")
    return WIN_COMBINATIONS[2] #bottom row win
  elsif   
    board[WIN_COMBINATIONS[3][0]].include?("X") && board[WIN_COMBINATIONS[3][1]].include?("X") && board[WIN_COMBINATIONS[3][2]].include?("X")
    return WIN_COMBINATIONS[3] #left column win
  elsif   
    board[WIN_COMBINATIONS[4][0]].include?("X") && board[WIN_COMBINATIONS[4][1]].include?("X") && board[WIN_COMBINATIONS[4][2]].include?("X")
    return WIN_COMBINATIONS[4] #middle column
  elsif   
    board[WIN_COMBINATIONS[5][0]].include?("X") && board[WIN_COMBINATIONS[5][1]].include?("X") && board[WIN_COMBINATIONS[5][2]].include?("X")
    return WIN_COMBINATIONS[5] #right column
  elsif   
    board[WIN_COMBINATIONS[6][0]].include?("X") && board[WIN_COMBINATIONS[6][1]].include?("X") && board[WIN_COMBINATIONS[6][2]].include?("X")
    return WIN_COMBINATIONS[6] #diagonal1 win
  elsif   
    board[WIN_COMBINATIONS[7][0]].include?("X") && board[WIN_COMBINATIONS[7][1]].include?("X") && board[WIN_COMBINATIONS[7][2]].include?("X")
    return WIN_COMBINATIONS[7] #diagonal2 win

  #check O
    elsif
    board[WIN_COMBINATIONS[0][0]].include?("O") && board[WIN_COMBINATIONS[0][1]].include?("O") && board[WIN_COMBINATIONS[0][2]].include?("O") 
    return WIN_COMBINATIONS[0] #top row win
  elsif   
    board[WIN_COMBINATIONS[1][0]].include?("O") && board[WIN_COMBINATIONS[1][1]].include?("O") && board[WIN_COMBINATIONS[1][2]].include?("O")
    return WIN_COMBINATIONS[1] #middle row win
  elsif   
    board[WIN_COMBINATIONS[2][0]].include?("O") && board[WIN_COMBINATIONS[2][1]].include?("O") && board[WIN_COMBINATIONS[2][2]].include?("O")
    return WIN_COMBINATIONS[2] #bottom row win
  elsif   
    board[WIN_COMBINATIONS[3][0]].include?("O") && board[WIN_COMBINATIONS[3][1]].include?("O") && board[WIN_COMBINATIONS[3][2]].include?("O")
    return WIN_COMBINATIONS[3] #left column win
  elsif   
    board[WIN_COMBINATIONS[4][0]].include?("O") && board[WIN_COMBINATIONS[4][1]].include?("O") && board[WIN_COMBINATIONS[4][2]].include?("O")
    return WIN_COMBINATIONS[4] #middle column
  elsif   
    board[WIN_COMBINATIONS[5][0]].include?("O") && board[WIN_COMBINATIONS[5][1]].include?("O") && board[WIN_COMBINATIONS[5][2]].include?("O")
    return WIN_COMBINATIONS[5] #right column
  elsif   
    board[WIN_COMBINATIONS[6][0]].include?("O") && board[WIN_COMBINATIONS[6][1]].include?("O") && board[WIN_COMBINATIONS[6][2]].include?("O")
    return WIN_COMBINATIONS[6] #diagonal1 win
  elsif   
    board[WIN_COMBINATIONS[7][0]].include?("O") && board[WIN_COMBINATIONS[7][1]].include?("O") && board[WIN_COMBINATIONS[7][2]].include?("O")
    return WIN_COMBINATIONS[7] #bottom row win

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
