# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
       board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
       return combination
     end
  end
  return false
end

def full?(board)
  board.all? { |space| space == "X" || space == "O" }
end

def draw?(board)
  !won?(board) && full?(board) ? true : false
end

def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  board[won?(board)[0]] if won?(board)
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