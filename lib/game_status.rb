# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

#WIN_COMBINATIONS.each do |win_index|
#  win_index.each do |win_location|
#  end
#end

#def won?(board)
#  WIN_COMBINATIONS.detect do |combo|
#    board[combo[0]] == board[combo[1]] &&
#    board[combo[1]] == board[combo[2]] &&
#    position_taken?(board, combo[0])
#  end
#end

def won?(board)
  WIN_COMBINATIONS.detect do |win_index|
    board[win_index[0]] == board[win_index[1]] && 
    board[win_index[0]] == board[win_index[2]] &&
    position_taken?(board, win_index[0])
  end
end

def full?(board)
  board.none? do |cell|
    cell == " " || cell == ""
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if win_board = won?(board)
     board[win_board[0]]
  end
end


# Define your WIN_COMBINATIONS constant
