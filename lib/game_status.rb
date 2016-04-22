# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  if board.all?{ |square| square == " " } || draw?(board)
    false
  else
    winning_line(board)
  end
end

def winning_line(board)
  line = []
  WIN_COMBINATIONS.each do |lines|
    if board[lines[0]] == board[lines[1]] && board[lines[0]] == board[lines[2]] && board[lines[0]] != " "
      line = lines
    end
  end

  line
end

def draw?(board)
  board.none?{ |square| square == " " } && winning_line(board).eql?([])
end

def full?(board)
  board.none?{ |square| square == " " }
end

def over?(board)
  full?(board) || !winning_line(board).eql?([])
end

def winner(board)
  char = nil
  if winning_line(board).size == 3
    char = board[winning_line(board)[0]]
  end

  char
end

WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Backslash diagnol
  [2,4,6]   # Slash diagnol
]