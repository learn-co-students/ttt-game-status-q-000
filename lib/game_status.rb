# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end


# Define your WIN_COMBINATIONS constant
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


# Accept a board and return false/nil if there is no win combination in the board. Return the winning combination indexes as an array if there is a win.
def won?(board)
WIN_COMBINATIONS.each do |combination|
  combination.all? do |occupied|
    if position_taken?(board, occupied) == true
      if board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]
        return combination
      end
   end
  end
end
  return false
end


# accept a board and return true if every element in the board contains either an "X" or an "O"
def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end


# accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won.
def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end


# accepts a board and returns true if the board has been won, is a draw, or is full.
def over?(board)
  draw?(board) || won?(board)
end


# accept a board and return the token, "X" or "O" that has won the game given a winning board
def winner(board)
  the_winner = won?(board)
  if the_winner
    board[the_winner[0]]
  else
    return nil
  end
end