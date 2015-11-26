# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def position_taken2?(item)
  !(item.nil? || item == " ")
end

def character_check(board, location, character)
  board[location] == character
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],

  [0,3,6], #verticals
  [1,4,7],
  [2,5,8],

  [0,4,8], #diagonals
  [2,4,6]
]

def won?(board)
  #WIN_COMBINATIONS.select do |combo|
    #combo.all?{|i| position_taken?(board, i)}
  #end

  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|i| character_check(board, i, "X")} || combo.all?{|i| character_check(board, i, "O")}
      return combo
    end
  end

  return false
end

def full?(board)
  #board.all?{|i| position_taken?(board, i)}

  board.all? do |i|
    position_taken2?(i)
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  result = won?(board)
  if result == false
    return nil
  else
    return board[result[0]]
  end
end