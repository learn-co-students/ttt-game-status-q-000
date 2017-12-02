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
  winning_combo = nil

  WIN_COMBINATIONS.each do |combo|
    winning_combo = combo if combo.all? {|c| board[c] == "X"} || combo.all? {|c| board[c] == "O"}
  end

  winning_combo
end

def full?(board)
  board.all? {|p| p != " " && !!p}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end