# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS=[
  [0,1,2],[3,4,5],[1,4,7],[2,5,8],[0,3,6],[6,7,8],[0,4,8],[2,4,6]
  ]

#board[number].is_a? - "X" || "O"
def won?(board)

WIN_COMBINATIONS.detect do |win_combination|

    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")

      return [win_combination[0],win_combination[1],win_combination[2]]
  else
      false
  end
  end
end

def full?(board)

  board.each do |positions|
    if positions == " "
      return false
    else
      true
    end
  end
end

def draw?(board)
  if won?(board)
    false
  else if full?(board)
    true
    return true
  else
    false
  end
end
end


def over?(board)
  if won?(board)
    true
  else if draw?(board)
    true
  else if full?(board)
    true
    return true
  else false
  end
end
end
end

def winner(board)
  win = won?(board)
  if won?(board)
    true
    return board[win[0]]
  end
end



