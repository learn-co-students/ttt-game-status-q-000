# Helper Method

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

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
# Define your WIN_COMBINATIONS constant

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win = win_combination.all? do |position|
      board[position] == "X"
    end
    if win
      return win_combination
    end
    win = win_combination.all? do |position|
      board[position] == "O"
    end
    if win
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.none? do |position|
    position == " " || position.nil?
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end







