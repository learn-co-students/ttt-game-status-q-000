# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  indexes = Array.new
  if WIN_COMBINATIONS.any? do |combo|
      indexes = combo
      (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") \
      || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
    end
    indexes
  else
    false
  end
end

def full?(board)
  board.none? { |cell| (cell == " " || cell == "" || cell.nil?) }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
