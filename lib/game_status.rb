# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_conbination| # [0,1,2], ...
    position_taken?(board, win_conbination[0]) && board[win_conbination[0]] == board[win_conbination[1]] && board[win_conbination[0]] == board[win_conbination[2]]
  end
end

def full?(board)
  indexes = [0,1,2,3,4,5,6,7,8];
  indexes.all? do |index|
    position_taken?(board, index);
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true;
  else
    return false;
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true;
  else
    return false;
  end
end

def winner(board)
  if won?(board)
    winner = board[won?(board)[0]];
  end
  return winner;
end
