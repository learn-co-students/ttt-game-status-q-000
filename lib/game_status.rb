# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_pos1 = combo[0]
    win_pos2 = combo[1]
    win_pos3 = combo[2]

    position1 = board[win_pos1]
    position2 = board[win_pos2]
    position3 = board[win_pos3]

    if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  !board.any?{ |i| i == " " || i.nil? }
end

def draw?(board)
  if full?(board)
    if !won?(board)
      return true
    else
      return false
    end
  elsif !won?(board)
    return false
  else
    return false
  end
end

def over?(board)
  if !draw?(board)
    if !won?(board)
      return false
    else
      return true
    end
  else
    return true
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end