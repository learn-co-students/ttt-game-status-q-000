WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]

def won?(board)
  indexes = Array.new
  if WIN_COMBINATIONS.any? do |combination|
    indexes = combination
    board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" || board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
  end
  return indexes
else
  return false
end
end

def full?(board)
  board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  elsif
    full?(board) == false && won?(board) == false
    return false
  else
    false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
   else
    return false
   end
end

def winner(board)
  if won?(board) == false
      return nil
    end
  won?(board).each do |position|
    if board[position] == "X"
      return "X"
    else board[position] == "O"
      return "O"
    end
  end
end




