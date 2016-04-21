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

# won?
def won?(board)
  WIN_COMBINATIONS.any? do |win_combo|
    p1 = board[win_combo[0]]
    p2 = board[win_combo[1]]
    p3 = board[win_combo[2]]
    if p1 == "X" && p2 == "X" && p3 == "X"
      return win_combo
    elsif p1 == "O" && p2 == "O" && p3 == "O"
      return win_combo
    else
      false
    end
  end
end

# full?
def full?(board)
  board.all? do |location|
    location == "X" || location == "O"
  end
end

# draw?
def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

# over?
def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) != false
    true
  else
    false
  end
end

# winner
def winner(board)
  if won?(board) != false
    winner_combo = won?(board)
    return board[winner_combo[0]]
  else
    nil
  end
end
