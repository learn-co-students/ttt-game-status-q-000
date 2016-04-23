
def won?(board)
 WIN_COMBINATIONS.each do |combination|
  if position_taken?(board, combination[0]) && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
     return combination
   end
 end
 return false
end

def full?(board)
 [0,1,2,3,4,5,6,7,8].each do |position|
   if !position_taken?(board, position)
     return false
   end
 end
 true
end

def draw?(board)
  if !won?(board) && full?(board)
   return true
 end
 false
end

def over?(board)
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


# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
# combination 1 [0,4,8]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
 ]

#WIN_COMBINATIONS.each do ||
#    if board[WIN_COMBINATIONS[0]] == "X"
#   "X won in the top row"

#if win_combinations == 0
#true
# if  board == nil || ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
#  false
#    end
#end

#top row win = WIN_COMBINATIONS[0]
#middle row win = WIN_COMBINATIONS[1]
#bottom row win = WIN_COMBINATIONS[2]
#left column win = WIN_COMBINATIONS[3]
#middle column win = WIN_COMBINATIONS[4]
#right column win = WIN_COMBINATIONS[5]
#left diagonal win = WIN_COMBINATIONS[6]
#right diagnonal win = WIN_COMBINATIONS[7]
