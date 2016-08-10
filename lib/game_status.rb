# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  # Horizonal wins
  [0,1,2],
  [3,4,5],
  [6,7,8],
  # Vertical wins
  [0,3,6],
  [1,4,7],
  [2,5,8],
  # Diagonal wins
  [0,4,8],
  [2,4,6]
]

def won?(board)
  win = false
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      "X won in the top row"
      win = combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      "O won in the top row"
      win = combo
    end
  end
  win
end

def full?(board)
  board.none? {|i| i == " " }
end

def draw?(board)
  full?(board) &! won?(board) ? true : false
end

def over?(board)
  draw?(board) || won?(board) ? true: false
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
