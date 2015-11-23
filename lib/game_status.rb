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
  board.none? ? false : nil
  WIN_COMBINATIONS.each do |x|
    if position_taken?(board, x[0]) && position_taken?(board, x[1]) && position_taken?(board, x[2])
      if (board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X") || (board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O")
        return x
      end
    end
  end
  return false
end

def full?(board)
  board.include?(" ") ? false : true
end

def draw?(board)
  won?(board) ? false : true
end

def over?(board)
  (draw?(board) || won?(board)) && (full?(board)) ? true : false
end

def winner(board)
  if won?(board)
    won?(board).select do |x|
      board[x] == "X" ? (return "X") : (return "O")
    end
  end
end


