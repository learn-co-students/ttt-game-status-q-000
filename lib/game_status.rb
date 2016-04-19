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
  return false if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  winarr = []
  WIN_COMBINATIONS.each do |arr|
      if board[arr[0]] == board[arr[1]] && board[arr[1]] == board[arr[2]]
        winarr << arr unless board[arr[0]] == ' '
      end
  end
  if winarr.count == 1
    winarr.flatten
  else
    false
  end
end

def full?(board)
  board.count(" ") == 0
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  board[won?(board)[0]] if over?(board)
end