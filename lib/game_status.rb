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
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") ||
       (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
      return win_combo
      end
    end
    nil
end

def full?(board)
  !board.detect do |pos|
    pos == " "
  end 
end

  def draw?(board)
    if won?(board) || !full?(board)
      false
    else
      true
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
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
