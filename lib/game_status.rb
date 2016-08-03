# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#WIN constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #horizontal middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #left diagonal
  [2, 4, 6]  #right diagonal
  ]

def won?(board)
  board.all? {|i| i != " " || i != ""}
  winning_array = WIN_COMBINATIONS.detect do |win_array|
    if win_array.all? {|position| board[position] == "X" } == true
      winning_array.inspect
    elsif win_array.all? {|position| board[position] == "O" } == true
      winning_array.inspect
    end
  end
end

def full?(board)
  board.none? {|i| i == "" || i == " "}
end

def draw?(board)
  (full?(board) == true) && (won?(board) == nil)
end

def over?(board)
  over = true
  if full?(board) == false
    over = false
  end
  over
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end