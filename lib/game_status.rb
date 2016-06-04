require 'pry'
def position_taken?(board, location)
  if !board[location].nil? || board[location] == " "
    false
  else
    true
  end
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]



def won?(board)
  if WIN_COMBINATIONS.detect do |win_combo|
    if board[win_combo[0]] == "X" &&  board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
      return win_combo
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
      return win_combo
    end
  end
  else
    return false
  end
end

def full?(board)
  if board.detect do |i|
    if i == " "
      return false
    end
  end
  else
    true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    win_combo = won?(board)
    if board[win_combo[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
