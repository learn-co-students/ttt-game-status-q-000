# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |checkloc|
    if (board[checkloc[0]] == "X" && board[checkloc[1]] == "X" && board[checkloc[2]] == "X") || (board[checkloc[0]] == "O" && board[checkloc[1]] == "O" && board[checkloc[2]] == "O")
      return checkloc
    end
  end
  nil
end

def full?(board)
  board.all? { |e|  e =="X" || e == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
    won?(board) ? board[won?(board)[0]] : nil
end
