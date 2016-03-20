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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      # x wins
      return combo
    end
    
    if board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      # o wins
      return combo
    end

    if board[combo[0]] == "" && board[combo[1]] == "" && board[combo[2]] == ""
      # empty board
      return false
    end

    #draw game
    return false
  end

  return nil
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
