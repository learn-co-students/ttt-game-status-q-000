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
  all_blank = board.all? do |i|
    i == " "
  end
  if all_blank
    return false
  end
  WIN_COMBINATIONS.each do |i|
    if (board[i[0]] == "X" && board[i[1]] == "X" && board[i[2]] == "X") || (board[i[0]] == "O" && board[i[1]] == "O" && board[i[2]] == "O")
      return i
    end  
  end
  return false
end

def full?(board)
  none_blank = board.none? do |i|
    i == " "
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    winner = board[won?(board)[0]]
  end
end