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
  [2,4,6],
]

def won?(board)
WIN_COMBINATIONS.each do |win_combination|
  if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
    return win_combination
  end
end
nil

end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if full?(board) && !(won?(board))
    true
end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
      return "X"
    end
    if board[win_combination[0]] == "O" && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
        return "O"
    end
  end
  nil
end
