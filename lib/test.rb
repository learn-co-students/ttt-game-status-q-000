board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0, 1, 2], 
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)

WIN_COMBINATIONS.each do |win_combination|
  all_X = win_combination.all? do |win_index| 
    board[win_index] == "X"
  end
  all_O = win_combination.all? do |win_index| 
    board[win_index] == "O"
  end
  all_taken = win_combination.all? do |win_index|
    position_taken?(board, win_index)
  end
if all_X == true || all_O == true
  # return win_combination
  return true
elsif board == [" ", " ", " ", " ", " ", " ", " ", " ", " "] || all_taken == true
 return false
end
end  

def draw?(board)
  if full?(board) == true && won?(board) == false
  true
elsif full?(board) == false && won?(board) != false
  false
end
end

draw?(board)