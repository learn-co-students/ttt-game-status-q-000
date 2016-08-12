# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    board_portion = [board[win_combination[0]], board[win_combination[1]], board[win_combination[2]]]
    board_portion.join == "XXX" || board_portion.join == "OOO"
  end
end

def full?(board)
  index = [0,1,2,3,4,5,6,7,8]
  index.all? {|i| position_taken?(board, i)}
end

def draw?(board)
  if !(won?(board)) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  board_return = won?(board)
  puts board_return.inspect
  if board_return.class == Array
    if board[board_return[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end
