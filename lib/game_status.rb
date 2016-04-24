# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  !won?(board) ? board.all? {|position| position != " "} : false
end

def full?(board)
  draw?(board) && !won?(board)
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board).kind_of?(Array)
    true
  end
end

def won?(board)
  winning_combo = []
  win = true
  WIN_COMBINATIONS.each do |combo|
    combo.all? {|position| board[position] == "X"} ? winning_combo = combo : win = false
    combo.all? {|position| board[position] == "O"} ? winning_combo = combo : win = false
  end
  !winning_combo.empty? ? winning_combo : win
end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    board[winning_combo[0]]
  else
    nil
  end
end