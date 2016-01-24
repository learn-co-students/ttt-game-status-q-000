# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,4,8], #L>R diagonal
    [2,4,6], #R>L diagonal
    [0,3,6], #Left colomn
    [1,4,7], #Middle diagonal
    [2,5,8] #Right diagonal
  ]
def won?(board)
  #returns winning combo if any win_combinations of 3 are filled correctly, false otherwise, if by running position taken and calling position 0 we find that slot is filled by nil or " " it is not possible that there is a win, therefore false
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
end


def full?(board)
  #returns true for a draw and false for in progress
  #call all and name token
  #if all positions are filled with tokens =true, if all positions are not = false
  board.all? do |token|
    token == "X" || token == "O"
  end
end
# from lesson:
# all_odd = [1,3].all? do |number|
# number.odd? # Will evaluate to true for 1, true for 3
#end #=> true
#all_odd
def draw?(board)
  #must be true for a draw, false for in progress,<<so use full? then && so that both sides must evauluate true and since it must be false for a won game >> !won?
  full?(board) && !won?(board)
end

def over?(board)
  #false for in progress, true for won, true for draw
  #therefore we can use draw? and won?
  draw?(board) || won?(board)
end

def winner(board)
  #return x when x won, o when o won, nil when no winner
  #winner method should accept a board
  #return the token, "X" or "O" that has won the game
  #given a winning board.
  #they will always have to be in position 0 as seen in the won? method

  if winner = won?(board)
    board[winner[0]]
  end
end
