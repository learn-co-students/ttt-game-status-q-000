# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
   [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
   [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ]

 def won?(board)
   WIN_COMBINATIONS.each do |row|
     return row if row.all? {|i| board[i] == "X"} || row.all? {|i| board[i] == "O"}
   end
   return false
 end

def full?(board)
  #return false if won?(board)
  WIN_COMBINATIONS.all? do |row|
    row.all? {|i| position_taken?(board, i)}
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_row = won?(board)
  return board[win_row[0]] if win_row 
end




