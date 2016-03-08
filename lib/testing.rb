# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
WIN_COMBINATIONS.each do |array|
  test_array=[]
  array.each do |element|
    if position_taken?(board, element)
    test_array << board[element]
  end
end
if test_array != [] && (test_array[0] == test_array[1] && test_array[0] == test_array[2])
  return array
end
end
return false 
end 

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end 
end 

def draw?(board)
  if won?(board) == false && full?(board) == true 
    return true 
  else 
    return false
  end 
end 

def over?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end 
end 

def winner(board)
  if won?(board)
    puts board[won?(board)[0]]
  end
end


puts winner(["O", " ", " ", " ", "O", " ", " ", " ", "O"])

