# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,4,8], # Top-Left, Middle, Bottom-right
  [2,4,6], # Top-Right, Middle, Bottom-left
  [0,3,6], # Left Row
  [1,4,7], # Middle Row
  [2,5,8] # Right Row
]

board = ["X", "X", "X", " ", " ", " ", " ", "O", "X"]

def won?(board)
  empty_board = board.all? do |empty|
    empty == " "
  end

  if empty_board == true
    return false
  else WIN_COMBINATIONS.each do |wins|
        if board[wins[0]] == "X" && board[wins[1]] == "X" && board[wins[2]] == "X"
          return wins
        elsif board[wins[0]] == "O" && board[wins[1]] == "O" && board[wins[2]] == "O"
          return wins
        end
      end
      return false
  end
end

def full?(board)
  full_board = board.all? do |full|
    full == "X" || full == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board)
    true
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    true
  end
end

def winner(board)
  if over?(board)
    return board[won?(board)[0]]
  end
end
