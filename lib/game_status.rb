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

def won?(board)
  result = false
  WIN_COMBINATIONS.each do |winning_combo|
    if !result
      if winning_combo.all?{|i| board[i]=="X"} || winning_combo.all?{|i| board[i]=="O"}
        result = winning_combo
      end
    end
  end
  result
end

def full?(board)
  board.all?{|i| (i == "X" || i == "O")}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winning_indices = won?(board)
  if winning_indices
    board[winning_indices[0]]
  else
    nil
  end
end