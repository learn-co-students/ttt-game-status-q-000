# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

#0 | 1 | 2
#3 | 4 | 5
#6 | 7 | 8

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[2,4,6],
[0,4,8],
[0,3,6],
[1,4,7],
[2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do | combo |
    if combo.all?{ | position | board[position] == "X" } || combo.all?{ | position | board[position] == "O" }
       return combo
    end
  end
  return false
end


def full?(board)
#return true for a draw
#if you didn't win and the board has no spaces
  if board.none?{ | position | position == " "}
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
     nil
  end
end

board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
puts winner(board)
