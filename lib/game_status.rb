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
  [6, 4, 2]
]

def won?(board)
  result = WIN_COMBINATIONS.select do |combo|
    ["X", "O"].any? do |player|
      board[combo[0]] == player && 
        board[combo[1]] == player && 
        board[combo[2]] == player
    end
  end
  result != [] ? result[0] : false
end

def full?(board)
  board.all? do |board_space|
    board_space == "X" || board_space == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  winning_combo = won?(board)
  winning_combo ? board[winning_combo[0]] : nil
end

