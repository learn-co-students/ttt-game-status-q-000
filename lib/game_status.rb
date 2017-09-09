# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect { |combination| (board[combination[0]] == "X" || board[combination[0]] == "O") && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] }
end

def full?(board)
  board.all? { |position| position == "X" || position == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
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
