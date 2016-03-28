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
  [6,4,2]
]


def won?(board)
  result = false
  WIN_COMBINATIONS.each do |win_combination|
    if !result
      if win_combination.all?{|i| board[i]=="X"} || win_combination.all?{|i| board[i]=="O"}
        result = win_combination
      end
    end
  end
  result
end

def full?(board)
  board.all?{|i| (i=="X"||i=="O")}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winning_indices = won?(board)
  if winning_indices
    board[winning_indices[0]]
  else
    nil
  end
end

