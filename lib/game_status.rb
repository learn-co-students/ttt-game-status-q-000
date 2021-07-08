# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

  WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all? {|i| board[i] == "X"}
        win_combination
      elsif win_combination.all? {|i| board[i] == "O"}
        win_combination
      else
        false
      end
  end

end

def full?(board)
  !(board.include?(" ") || board.include?(nil))
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end
