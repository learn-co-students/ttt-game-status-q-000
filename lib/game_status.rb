# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]

def won?(board)
  WIN_COMBINATIONS.find { |winning_move|
    if position_taken?(board, winning_move[0]) && board[winning_move[0]] == board[winning_move[1]] && board[winning_move[1]] == board[winning_move[2]]
       [winning_move[0], winning_move[1], winning_move[2]]
    else
    end
    }
end

def full?(board)
  board.all? { |occupied| occupied == "X" || occupied == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    board[winning_combo[0]]
  else
  end
end



