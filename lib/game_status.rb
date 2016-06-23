# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]

def won?(board)
combo = 0
while combo < WIN_COMBINATIONS.length
  current = WIN_COMBINATIONS[combo]
  test_array = []
  index = 0
  while index < current.length
    test_array << board[current[index]]
    index += 1
  end
  if test_array.all?{|i| i == "X"} == true
  return WIN_COMBINATIONS[combo]
  elsif test_array.all?{|j| j == "O"} == true
  return WIN_COMBINATIONS[combo]
end
  combo += 1
end
false
  end

def full?(board)
  if board.any?{|space| space == " "} == true
    false
  else true
  end
end

def draw?(board)
  if won?(board) == false
    true
  else false
  end
  end

def over?(board)
  if full?(board) == false
    false
  else true
  end
end

def winner(board)
  combo = 0
while combo < WIN_COMBINATIONS.length
  current = WIN_COMBINATIONS[combo]
  test_array = []
  index = 0
  while index < current.length
    test_array << board[current[index]]
    index += 1
  end
  if test_array.all?{|i| i == "X"} == true
  return "X"
  elsif test_array.all?{|j| j == "O"} == true
  return "O"
end
  combo += 1
end
return nil
  end




