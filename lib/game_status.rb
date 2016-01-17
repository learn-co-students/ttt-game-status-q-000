# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

#WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

#won? method
def won?(board)
  WIN_COMBINATIONS.find do |wins|
    board[wins[0]] == board[wins[1]] && board[wins[1]] == board[wins[2]] && position_taken?(board, wins[0])
  end
end

#full? method
def full?(board)
  board.all? do |letter|
    letter == "X" || letter == "O"
  end
end

#draw? method
def draw?(board)
  full?(board) && !won?(board)
end

#over? method
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

#winner method
def winner(board)
  if won?(board) == true
    won?(board[1])
  else
    nil
  end
end



