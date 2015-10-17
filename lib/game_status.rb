# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]

def won?(board)
  index =[0,1,2,3,4,5,6,7,8]
  x_pos = index.select {|position| board[position] == "X"}
  o_pos = index.select {|position| board[position] == "O"}
  WIN_COMBINATIONS.each do |combination|
    #puts combination.inspect
    if combination.all? {|position| x_pos.include?(position)} || combination.all? {|position| o_pos.include?(position)}
      return combination
    else
    end
  end
  return false
end

def full?(board)
  if board.all? {|position| position == "X" || position =="O" }
    true
  else
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board)
    false
  elsif !won?(board) && !full?(board)
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  elsif
    false
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    index =[0,1,2,3,4,5,6,7,8]
    x_pos = index.select {|position| board[position] == "X"}
    o_pos = index.select {|position| board[position] == "O"}
    WIN_COMBINATIONS.each do |combination|
    #puts combination.inspect
    if combination.all? {|position| x_pos.include?(position)}
      return "X"
    elsif combination.all? {|position| o_pos.include?(position)}
      return "O"
    else
    end
  end
end
end








