# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
   [0,1,2], # top row
   [3,4,5], # middle row
   [6,7,8], # bottom row
   [0,3,6], # left column
   [1,4,7], # middle column
   [2,5,8], # right column
   [0,4,8], # left diag
   [2,4,6] # right diag
]

def won?(board)
   WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
      end
   end
   return false
end

def full?(board)
   board.all? do |str|
   str == "O" || str == "X"
   end
end

def draw?(board)
   if full?(board) && !won?(board)
      return true
   end
end

def over?(board)
   if draw?(board) || won?(board)
      return true
   end
end

def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   else
      return nil
   end
end
