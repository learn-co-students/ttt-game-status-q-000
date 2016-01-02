# Helper Method

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left row
  [1, 4, 7], # Middle row
  [2, 5, 8], # Right row
  [0, 4, 8], # Backslash \
  [2, 4, 6], # Forward slash /
  ]

def won?(board)
  #return win combination indexes or nil
  #iterate over WIN_COMBINATIONS
  WIN_COMBINATIONS.any? do |nested_array|
    if nested_array.all? { |index_position| board[index_position] == "X" } == true
      return nested_array
    elsif nested_array.all? { |index_position| board[index_position] == "O" } == true
      return nested_array
    else
    end
  end
end

def full?(board)
  #return true if all positions taken
  if board.all? do |token|
    token == "X" || token == "O"
    end
  return true
  else
  return false
  end
end

def draw?(board)
  #return true if no win and full, false if no win and not full, false if win
  if won?(board) == false && full?(board) == true
    then true
    elsif won?(board) == false && full?(board) == false
    then false
  elsif won?(board) == true
    then false
  end
end

def over?(board)
  #return true if board won, draw, or full
  if won?(board) == true
    return true
  elsif draw?(board) == true
    return true
  elsif full?(board) == true
    return true
  end
end

def winner(board)
  #return "X" or "O" winner
  if won?(board).all? { |nested_position| board[nested_position] == "X" }
    return "X"
  elsif won?(board).all? { |nested_position| board[nested_position] == "O" }
    return "O"
  else
    return nil
  end
end