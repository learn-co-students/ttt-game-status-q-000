# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  WIN_COMBINATIONS.each do |combo|
    win = []
    combo.each do |index|
      #break if !position_taken?(board, index) || (!win.nil? && win[0] != board[index])

      win << board[index]
    end

    return combo if win == ["X", "X", "X"] || win == ["O", "O", "O"]
  end

  false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    winner = ""
    winner = board[win_combo[0]]
  end
end