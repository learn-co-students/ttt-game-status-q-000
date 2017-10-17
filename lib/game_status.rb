# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Left column
  [0,4,8],  # Diagonal 1
  [2,4,6]   # Diagonal 2
]

def won?(board)
  #check for empty board first
  if (board.detect { |e| e=="X" || e=="O" }) == nil then return false
  end

  #otherwise check for winning combinations
  WIN_COMBINATIONS.each do |combo|

    if (board[combo[0]]== "X" && board[combo[1]] == "X" && board[combo[2]]== "X") ||
    (board[combo[0]]== "O" && board[combo[1]] == "O" && board[combo[2]]== "O") then return combo
    end
  end
  return false
end

# check for a full board, all spots used
def full?(board)
  board.all?{|a| (a=="X" || a== "O")}
end

# check for a draw if board is full and no winner
def draw?(board)
  if full?(board) && !won?(board) then return true
  end
end

# check if the game is over
def over?(board)
  if full?(board) || won?(board) || draw?(board) then return true
  end
end

# check on X or O as winner and return "X" or "O"
def winner(board)
  if won?(board) then return board[won?(board)[0]]
  end
end
