# Helper Method
def position_taken?(board, location)
 !(board[location].nil? || board[location] = " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal left
  [2,4,6]  #Diagonal right
]
# winning board combinations
def won?(board)
  WIN_COMBINATIONS.select do |location|
    if board[location[0]] == "X" && board[location[1]] == "X" && board[location[2]] == "X"
      return location
    elsif board[location[0]] == "O" && board[location[1]] == "O" && board[location[2]] == "O"
      return location
    else
      false
    end
  end

# empty board and draw
  WIN_COMBINATIONS.any? do |location|
   position_taken?(board,location[0])  && position_taken?(board,location[1])  && position_taken?(board,location[2])
 end
end

#full board
def full?(board)
  #draw and in progress
  WIN_COMBINATIONS.all? do |location|
    board[location[0]] != " " && board[location[1]] != " " && board[location[2]]  != " "
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won?(board)
    if board.count("X") > board.count("O")
      return "X"
    elsif board.count("X") < board.count("O")
      return "O"
    end
end
