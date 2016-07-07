# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row = WIN_COMBINATIONS[0]
  [3, 4, 5], # Middle row = WIN_COMBINATIONS[1]
  [6, 7, 8], # Bottom row = WIN_COMBINATIONS[2]
  [0, 3, 6], # Left column = WIN_COMBINATIONS[3]
  [1, 4, 7], # Middle column = WIN_COMBINATIONS[4]
  [2, 5, 8], # Right column = WIN_COMBINATIONS[5]
  [0, 4, 8], # Left-to-right Diagonal = WIN_COMBINATIONS[6]
  [2, 4, 6] # Right-to-left Diagonal = WIN_COMBINATIONS[7]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && 
    board[win_combo[1]] == board[win_combo[2]] && 
    position_taken?(board, win_combo[0])
  end
end

def full?(board)
end

def draw?(board)
end

def over?(board)
end

def winner(board)
end