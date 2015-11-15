# Helper Method
def position_taken?(board, location) # returns true if position is occupied or false if it is empty
  !(board[location].nil? || board[location] == " ")
end



WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
  ]

def won?(board) # returns winning array if it finds one, otherwise false
  x_o = ["X", "O"]
  x_o.each do |player|

  if board[WIN_COMBINATIONS[0][0]] == player && board[WIN_COMBINATIONS[0][1]] == player && board[WIN_COMBINATIONS[0][2]] == player
  return [0,1,2]
  else false
  end

  if board[WIN_COMBINATIONS[1][0]] == player && board[WIN_COMBINATIONS[1][1]] == player && board[WIN_COMBINATIONS[1][2]] == player
  return [3,4,5]
  else false
  end

  if board[WIN_COMBINATIONS[2][0]] == player && board[WIN_COMBINATIONS[2][1]] == player && board[WIN_COMBINATIONS[2][2]] == player
  return [6,7,8]
  else false
  end

  if board[WIN_COMBINATIONS[3][0]] == player && board[WIN_COMBINATIONS[3][1]] == player && board[WIN_COMBINATIONS[3][2]] == player
  return [0,3,6]
  else false
  end

  if board[WIN_COMBINATIONS[4][0]] == player && board[WIN_COMBINATIONS[4][1]] == player && board[WIN_COMBINATIONS[4][2]] == player
  return [1,4,7]
  else false
  end

   if board[WIN_COMBINATIONS[5][0]] == player && board[WIN_COMBINATIONS[5][1]] == player && board[WIN_COMBINATIONS[5][2]] == player
  return [2,5,8]
  else false
  end

   if board[WIN_COMBINATIONS[6][0]] == player && board[WIN_COMBINATIONS[6][1]] == player && board[WIN_COMBINATIONS[6][2]] == player
  return [6,4,2]
  else false
  end

  if board[WIN_COMBINATIONS[7][0]] == player && board[WIN_COMBINATIONS[7][1]] == player && board[WIN_COMBINATIONS[7][2]] == player
  return [0,4,8]
  else false
  end
end
  false
end

def full?(board) # returns true if board is full, otherwise false
   all_full = board.all? do |contents|
     contents == "X" || contents == "O"
  end
end

def draw?(board) # returns true if the board is full and nobody's won, otherwise false
  if won?(board) == true
    false
  elsif full?(board) == true && won?(board) == false
    true
  end
end

def over?(board) # returns true if the game is won or is a draw, otherwise false
  won?(board) || draw?(board) == true
end

def winner(board)
  winning_array = won?(board)
  if won?(board).class == Array
    if board[winning_array[0]] == "X"
      return "X"
    else
      return "O"
  end
  end
end

def turn_count(board) # returns number of turns taken
  counter = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
    counter+= 1
    end
  end
  counter
end

def current_player(board) # returns the current player (but assumes X went first!)
  turn_count(board) % 2 == 0 ? "X" : "O"
end