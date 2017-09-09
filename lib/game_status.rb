
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |combinations|
    if (board[combinations[0]]== "X" && board[combinations[1]]=="X" && board[combinations[2]]=="X") ||
      (board[combinations[0]] == "O" && board[combinations[1]]== "O" && board[combinations[2]]== "O")
    return combinations
  end
end
return false
end




def full?(board)
  board.all? do |value|
    value == "X" || value == "O"
  end
end

def draw?(board)
  won = won?(board)
  if (board.all? {|value| value == "X" || value == "O" }) && (won == false)
    return true
  else
    false
end
end






def over?(board)
  (board.all? {|value| value == "X" || value == "O" }) ||
    won?(board)
end




def winner(board)
  combinations = won?(board)
  if combinations
    board[combinations[0]]
  else
    nil
end
end
