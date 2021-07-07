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

  WIN_COMBINATIONS.each do |i|
    if i.all? {|j| board[j] == "X"} || i.all?{|j| board[j] == "O"}
      return i
    end
  end

  return false
end

def full?(board)

  board.none? {|i| i == " " }

end

def draw?(board)

  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end

end

def over?(board)

  if draw?(board) == true || won?(board) != false
    return true
  end

end

def winner(board)

  if won?(board) == false
    return nil
  end
  
  i = won?(board)

  if board[i[0]] == "X"
    return "X"
  else
    return "O"
  end 

end