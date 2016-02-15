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
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
#   WIN_COMBINATIONS.each do |win_combination|
#     win_index1 = win_combination[0]
#     win_index2 = win_combination[1]
#     win_index3 = win_combination[2]

#     position_1 = board[win_index1]
#     position_2 = board[win_index2]
#     position_3 = board[win_index3]

#     if position_1 == "X" && position_2 == "X" && position_3 == "X" && position_taken?(board, win_combination[0])
#       return win_combination
#     elsif position_1 == "O" && position_2 == "O" && position_3 == "O" && position_taken?(board, win_combination[0])
#       return win_combination
#     else
#       false
#     end
#   end
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if winner = won?(board)
    board[winner[0]]
  end
end