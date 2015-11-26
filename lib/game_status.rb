# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
# win - board = ["X","X","X","X","X","X","X","X","X"]
# Lose  board = ["X","O","X","O","X","O","X","O","X"]


# Posible Winning Combinations

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


# Won the Game?

def won?(board)
  WIN_COMBINATIONS.detect do |winner|
    winner.all? {|token| board[token] == "X"} || winner.all? {|token| board[token] == "O"}
end
end

# The #full? method should accept a board and return true if every element in the board contains either an "X" or an "O". For example:

def full?(board)
  board.all? {|i| i == "O" || i == "X"}
end


#draw? that accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won.

def draw?(board)

 if
WIN_COMBINATIONS.detect do |winner|
  winner.all? {|token| board[token] == "X"} || winner.all? {|token| board[token] == "O"}
	end

 else
  board.all? {|i| i == "O" || i == "X"}

 end
end


#over? that accepts a board and returns true if the board has been won, is a draw, or is full.

def over?(board)

    board.all? {|i| i == "O" || i == "X"}

end

#winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board

def winner(board)
if
  WIN_COMBINATIONS.detect do |winner|
    winner.all? {|token| board[token] == "X"}
  end
    who_won = "X"
  elsif
    WIN_COMBINATIONS.detect do |winner|
    winner.all? {|token| board[token] == "O"}
    end
    who_won = "O"
  else
    who_won = nil
 end
end