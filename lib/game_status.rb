# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [ 0, 1, 2 ],
  [ 3, 4, 5 ],
  [ 6, 7, 8 ],
  [ 0, 3, 6 ],
  [ 1, 4, 7 ],
  [ 2, 5, 8 ],
  [ 0, 4, 8 ],
  [ 2, 4, 6 ] 
]

def won?(board)
  for win_combination in WIN_COMBINATIONS
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3) && 
      board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3]
      return win_combination
    end
  end

  board.each do |letter| 
    if letter == nil || letter == " "
      return false
    end
  end
  return false
end

def full?(board)
  emptySpot = board.detect { |i| i == nil || i == " " }
  gameStatus = won?(board)
 
  if emptySpot
    return false
  end

  if !emptySpot && gameStatus.is_a?(Array)
    return true
  end 

  if !emptySpot && gameStatus == false
    return true
  end 
end

def draw?(board)
  gameStatus = won?(board)

  if gameStatus.is_a?(Array)
    return false
  end

  if full?(board)
    return true
  end

  if !gameStatus
    return false
  end
end

def over?(board)
  if full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  winGame = won?(board)

  if winGame 
    checkX = winGame.detect{ |winX| board[winX] == "X"}
    checkO = winGame.detect{ |winO| board[winO] == "O"}

    if checkX
      return "X"
    elsif checkO
      return "O"
    end
  end
  return nil
end


