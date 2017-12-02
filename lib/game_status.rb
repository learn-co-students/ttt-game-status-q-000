# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    board_values = Array.new
    win_combination.each { |location| board_values.push(board[location]) }
    return win_combination if board_values.all? { |value| value == "O" }
    return win_combination if board_values.all? { |value| value == "X" }
  end
  false
end

def full?(board)
  board.all? { |value| value == "O" || value == "X" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end