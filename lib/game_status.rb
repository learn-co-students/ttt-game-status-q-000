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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  board[win_combination[0]] == "X"  && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" || board[win_combination[0]] == "O"  && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
  end
end


def full?(board)
  board.all? do |index|
    index != " "
  end
end


def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end



def winner(board)
 if won?(board)
  win_combo = won?(board)
 else
 return nil
 end 

 if board[win_combo[0]] == "X"
  "X"
  
 elsif board[win_combo[0]] == "O"
  "O"
 end


end






