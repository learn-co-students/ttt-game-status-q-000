# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal right
  [2,4,6]  # Diagonal left
]

def won?(board)
    i = 0
    while i < 8
      win_combination = WIN_COMBINATIONS[i]
        if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
          return WIN_COMBINATIONS[i]
        elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
          return WIN_COMBINATIONS[i]
        else
          false
        end
      i += 1
    end
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
    i = 0
    while i < 8
      win_combination = WIN_COMBINATIONS[i]
        if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
          return "X"
        elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
          return "O"
        else
          nil
        end
      i += 1
    end
end