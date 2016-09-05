# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

# won? detects if winning combination has been played and returns the positions
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    position_1 == position_2 && position_2 == position_3 &&
    position_taken?(board, win_combination[0])
  end
 end

#full? returns true if there are no empty spaces
 def full?(board)
   board.all? do |space|
     space != " "
   end
 end

#draw? returns true if the game is a draw - the board is full with no winners
 def draw?(board)
   full?(board) && !won?(board)
 end

#over? returns true if the board is full, or if the game is a draw or has been won
def over?(board)
  draw?(board) || full?(board) || won?(board)
end

#winner? returns the token in the first index of the returned winning position
def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end
