# win - board = ["X","O","X","O","X","O","X","O","X"]
# win - board = [" ", "O", "X", "O", "X", "O", "X", "O", "X"]
# draw  board = ["X","O","X","O","X","O","O","X","O"]
# incomplete  board = ["X","O","X","O"," ","O","X","O"," "]

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


# Define display_board that accepts a board and prints
# out the current state.

def display_board(board)
   puts  " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end


#counts turns taken from board

def turn_count(board)
  x = board.select {|i| i == "O" || i == "X"}
  count = x.size
end


# Who's turn

def current_player(board)
    x = board.select {|i| i == "O" || i == "X"}
    if x.size.even?
      player = "X"
    else
      player = "O"
    end
end


# Move

def move(board, choice , char)
  board[choice.to_i-1] = char

end

# Is the #position_taken?

def position_taken?(board, choice)

  if board[choice] == "O" || board[choice] == "X"
    taken = true
  else # board[choice] == "" || board[choice] == " " || board[choice] == "nil"
    taken = false
  end
end

# Is your move valid? #valid_move?

def valid_move?(board, i)
  if board[i.to_i-1] == "X" || board[i.to_i-1] == "O" || i.to_i < 1 || i.to_i > 9
    valid = false
    else
    valid = true
  end
end

# Take a Turn

def turn(board)
    puts "Please enter 1-9:"
    choice = gets
  valid = valid_move?(board, choice)
  if valid == true
      char = current_player board
      move(board, choice, char)


    else
      puts "Try Again Dummie"
      turn(board)
    end
end


#won?
# Your #won? method should accept a board as an argument and return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win. Use your WIN_COMBINATIONS constant in this method.

# Iterate over the possible win combinations defined in WIN_COMBINATIONS and check if the board has the same player token in each index of a winning combination. The pseudocode might look like:

# return on win = [0, 4, 8]
# return on draw = nil
# return on incomplete = nil

def won?(board)

if
  WIN_COMBINATIONS.detect do |winner|
    winner.all? {|token| board[token] == "X"} || winner.all? {|token| board[token] == "O"}
   end
else
  x = false
end
end


# The #full? method should accept a board and return true if every element in the board contains either an "X" or an "O". For example:
# returns truthy - true if full

def full?(board)
  board.all? {|i| i == "O" || i == "X"}
end


#draw? that accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won.
# returns true if !won && full, nil if won, nil if !won and full
# returns truthy

def draw?(board)

if
WIN_COMBINATIONS.detect do |winner|
   winner.all? {|token| board[token] == "X"} || winner.all? {|token| board[token] == "O"}
end

else
   board.all? {|i| i == "O" || i == "X"}
end
end


#Build a method #over? that accepts a board and returns true if the board has been won, is a draw, or is full. You should be able to compose this method solely using the methods you used above with some ruby logic.
#

def over?(board)


  # is board full
  board.all? {|i| i == "O" || i == "X"}


end

#winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board
# returns "X" or "O"

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