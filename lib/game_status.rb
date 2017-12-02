# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # NW-SE diagonal
  [2,4,6]  # NE-SW diagonal
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
  board.none?{|token| token == " " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    board[win_combination[0]]
  end
end

