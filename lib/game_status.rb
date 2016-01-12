# Helper Method

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

def won?(board)

  WIN_COMBINATIONS.detect do |win|
  if position_taken?(board, win[0]) && position_taken?(board, win[1]) && position_taken?(board, win[2]) && board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]]
    [win[0],win[1], win[2]]
  end
end
end


def full?(board)
  unless board.include?(" ")
    return true
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if win = won?(board)
    return board[win[0]]
  else
     nil
  end



end