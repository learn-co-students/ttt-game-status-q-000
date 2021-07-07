# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.detect { |index| (board[index[0]] == "X" && board[index[1]] == "X" && board[index[2]] == "X") || (board[index[0]] == "O" && board[index[1]] == "O" && board[index[2]] == "O") }
end

def full?(board)
  !(board.any? { |space| space.nil? || space == " " })
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board).class == Array ? board[won?(board)[0]] : nil
end