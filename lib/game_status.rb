# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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
  WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
        return combo unless board[combo[0]] == " "
      end
  end
  false
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) && board[won?(board)[0]] == "X"
    "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    "O"
  else
    nil
  end
end
