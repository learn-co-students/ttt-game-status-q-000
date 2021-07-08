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
   WIN_COMBINATIONS.each do |win_combination|
     tokens = [board[win_combination[0]],
               board[win_combination[1]],
               board[win_combination[2]]]
     all_tokens_X = tokens.all?{ |token| token == "X" }
     all_tokens_O = tokens.all?{ |token| token == "O" }
     return win_combination if all_tokens_X || all_tokens_O
   end
   false
 end

def full?(board)
  if board.none?{|token| token == " " }
    return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    board[win_combination[0]]
  end
end
