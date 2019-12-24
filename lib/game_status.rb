# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  WIN_COMBINATIONS.each do |win|
    win1 = win[0]
    win2 = win[1]
    win3 = win[2]

    position1 = board[win1]
    position2 = board[win2]
    position3 = board[win3]

    if (position1=="X" && position2 == "X" && position3 == "X")||(position1=="O" && position2 == "O" && position3 == "O")
      return win
    end
  end
  return false
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  if !won?(board)&&full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board)||draw?(board)||full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end


