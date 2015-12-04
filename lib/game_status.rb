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
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    end
  end
  false
end

def winner(board)
  winning_combo = won?(board)
  winning_combo ? board[winning_combo[0]] : nil
end

def full?(board)
  board.include?("") || board.include?(" ") || board.include?(nil) ? false : true
end

def over?(board)
  won?(board) || draw?(board) ? true : false
end

def draw?(board)
  won?(board) || !full?(board) ? false : true
end
