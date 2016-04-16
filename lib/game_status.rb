# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8], #right column win
  [0,4,8], #right diagonal win
  [2,4,6]  #left diagonal win
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_index|
    if win_index.all? { |i| board[i] == "X" }
      return win_index.to_a
    elsif win_index.all? { |i| board[i] == "O" }
      return win_index.to_a
    else
      false
    end
  end
end

def full?(board)
  board.all? { |cell| cell == "X" || "O" && cell != " " }
end

def draw?(board)
  won?(board) == false && full?(board) == true
end

def over?(board)
  won?(board) == true || full?(board) == true || draw?(board) == true
end

def winner(board)
  if won?(board) == false || draw?(board) == true
    return nil
  else WIN_COMBINATIONS.each do |win_index|
    if win_index.all? { |i| board[i] == "X" }
      return "X"
    elsif win_index.all? { |i| board[i] == "O" } 
      return "O"
    end
  end
  end
end