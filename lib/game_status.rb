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

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" ||
    board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
end
end


def full?(board)
  board.none?{|i| i == "" || i == " " || i == nil}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if over?(board)
    won_row = won?(board)
    return board[won_row[0]]
end
end
