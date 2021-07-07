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
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |row|
    first = board[row[0]]
    win = row.all? do |i|
      position_taken?(board, i) && board[i] == first
    end
    if win
      return row
    end
  end
  nil
end

def full?(board)
  board.all? do |i|
    ['X', 'O'].include?(i)
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  win = won?(board)
  if !win
    return nil
  end
  board[win[0]]
end