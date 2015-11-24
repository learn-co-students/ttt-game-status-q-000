# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #downward diagonal
  [6, 4, 2]  #upward diagonal
]

board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

def won?(board)
  @winner = nil
  array = []
  WIN_COMBINATIONS.each do |win_comb|
  if board[win_comb[0]] == "X" && board[win_comb[1]] == "X" && board[win_comb[2]] == "X"
    @winner = "X"
    array = win_comb
    break
  elsif board[win_comb[0]] == "O" && board[win_comb[1]] == "O" && board[win_comb[2]] == "O"
    @winner = "O"
    array = win_comb
    break
  else
    array = false
  end
end
  array
end

def full?(board)
  full = board.include?(" ")
  !full
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) == true
    true
  end
end

def winner(board)
  over?(board)
    @winner
end

won?(board)