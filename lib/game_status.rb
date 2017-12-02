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

def draw?(board)
  full?(board) && !won?(board)
end

def full?(board)
  board.all? {|position| position == "X" || position == "O"}
end

def over?(board)
  draw?(board) || won?(board).kind_of?(Array)
end

def won?(board)
#  winning_combo = []
#  win = true
#  WIN_COMBINATIONS.each do |combo|
#    combo.all? {|position| board[position] == "X"} ? winning_combo = combo : win = false
#    combo.all? {|position| board[position] == "O"} ? winning_combo = combo : win = false
#  end
#  !winning_combo.empty? ? winning_combo : win

  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end

end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    board[winning_combo[0]]
  else
    nil
  end
end