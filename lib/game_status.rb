# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #TOP ROW WIN
  [3,4,5], #MID ROW WIN
  [6,7,8], #BOT ROW WIN   #  0 | 1 | 2
  [0,3,6], #LEFT WIN      #  ---------
  [1,4,7], #MID WIN       #  3 | 4 | 5
  [2,5,8], #RIGHT WIN     #  ---------
  [0,4,8], #L2R WIN       #  6 | 7 | 8
  [2,4,6]  #R2L WIN

]

#WON METHOD

def won?(board)
 WIN_COMBINATIONS.detect do |sequence|
    board[sequence[0]] == board[sequence[1]] &&
    board[sequence[0]] == board[sequence[2]] &&
 	  position_taken?(board, sequence[0])
  end
end

#FULL METHOD

def full?(board)
   board.all? do |characters|
   characters == "X" || characters == "O"
  end 
end

#DRAW METHOD

def draw?(board)
    full?(board) && !won?(board)
end

#OVER METHOD

def over?(board)
	full?(board) == true
end

#WINNER METHOD
def winner(board)
   if winning_sequence = won?(board)
      board[winning_sequence.first]
  end
end 




