# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]

def won?(board)
  winning_combo = false
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all?{|index| board[index] == "X"}
      winning_combo = win_combination
    elsif win_combination.all?{|index| board[index] == "O"}
      winning_combo = win_combination
    end
  end
  winning_combo
end

def full?(board)
  board.all?{|character| character == "X" || character == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if over?(board) == false
    winner = nil
  elsif won?(board).all?{|index| board[index] == "X"}
    winner = "X"
  elsif won?(board).all?{|index| board[index] == "O"}
    winner = "O"
  end
end