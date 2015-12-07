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

def won?(board)
  x_o = ["X", "O"]
  x_o.detect do |player|
    WIN_COMBINATIONS.detect do |line|
      if board[line[0]] == player && board[line[1]] == player && board[line[2]] == player
        return line
      else false
      end
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