# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]


def won?(board)
  result = false
  WIN_COMBINATIONS.each do |win_combination|
    if !result
      if win_combination.all?{|i| board[i] == "X"} || win_combination.all?{|i| board[i] == "O"}
        result = win_combination
      end
    end
  end
  return result
end

def full?(board)
  board.all? {|i| (i == "X" || i == "O")}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  token = won?(board)
  if token
    board[token[0]]
  else
    nil
  end
end
