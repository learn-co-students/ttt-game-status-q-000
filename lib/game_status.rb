# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top 
  [3, 4, 5], #middle
  [6, 7, 8], #bottom
  [0, 3, 6], #left
  [1, 4, 7], #middle down
  [2, 5, 8], #right
  [2, 4, 6], #first diag
  [0, 4, 8]  #last diag
]

def won?(board)
  match = WIN_COMBINATIONS.select do |e|
    e.all? {|i| board[i.to_i] == "X"} || e.all? {|i| board[i.to_i] == "O"}
  end
  if match == []  
    match = nil
  else
    match = match[0]
  end
end

def full?(board)
  if board.all? { |cell| cell == "X" || cell == "O"}
    true
  else
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else 
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if over?(board) == true && won?(board) != nil
    match = WIN_COMBINATIONS.select do |e|
    e.all? {|i| board[i.to_i] == "X"} || e.all? {|i| board[i.to_i] == "O"}
    end
    who_won = board[match[0][0]]
    who_won = who_won.to_s
  else
    who_won = nil
  end
end