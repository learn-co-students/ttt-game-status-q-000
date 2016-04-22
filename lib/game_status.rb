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


def won?(board)
 WIN_COMBINATIONS.each do |combination|
   # comibnation 1 [0,4,8]
   if position_taken?(board, combination[0]) && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
     return combination
   end
 end
 return false
end

def full?(board)
 board.each_with_index do |character, position|
   if !position_taken?(board, position)
     return false
   end
 end
 true
end

def draw?(board)
  # returns true if the board has not been won and is full
  if !won?(board) && full?(board)
   return true
 end
 false
end

def over?(board)
  #returns true if the board has been won, is a draw, or is full
  if won?(board) || draw?(board) || full?(board)
    return true
  end
    return false
end

def winner(board)
 winning_combination = won?(board)
  if winning_combination
    return board[winning_combination[0]]
  end
  nil
end