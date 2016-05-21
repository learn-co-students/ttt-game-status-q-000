# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [3,4,5],
  [6,7,8]
]

def won?(board)

  WIN_COMBINATIONS.each do |win_combo|
    p1 = board[win_combo[0]]
    p2 = board[win_combo[1]]
    p3 = board[win_combo[2]]

    if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
      return win_combo
    end

  end
    return false
end

def full?(board)
  board.all? { |i| i == "X" || i == "O" }
end

def draw?(board)
  if (full?(board) == false)
    return false
  else
    if (won?(board) != false)
      return false
    else
      return true
    end
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif (won?(board) != false)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if (over?(board))
    if (board[won?(board)[0]] == "X")
      return "X"
    else
      return "O"
    end
  else
    
  end
end
