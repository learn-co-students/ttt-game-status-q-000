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
  WIN_COMBINATIONS.each do |win_combi|
    win = []
    win_combi.each do |win_item|
      win.push(board[win_item])
    end

    successX = win.all? do |char|
      char == "X"
    end
    successO = win.all? do |char|
      char == "O"
    end
    if successX || successO
      return win_combi
    end
  end

  return false #if after iterating through WIN_COMBINATIONS, no solution found then false is returned
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  return true if won?(board) == false && full?(board) == true
  return false #if true is not return then false must be returned
end

def over?(board)
  return true if won?(board) == true || full?(board) == true || draw?(board) == true
  return false #if true is not return then false must be returned
end

def winner(board)
  win = won?(board)
  if win
    board[win[0]]
  end
end