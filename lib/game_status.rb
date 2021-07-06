# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
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
  WIN_COMBINATIONS.detect do |win_combo|
    win_combo.all? { |index| board[index] == "X" } || win_combo.all? { |index| board[index] == "O" }  
  end
end

def full?(board)
  board.none? { |position| position == " " || position == nil }
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    return true
  elsif won?(board) != nil || full?(board) == false
    return false
  end
end

def over?(board)
  if full?(board) == false
    return false
  else return true
  end
end

def winner(board)
  if won?(board) == nil
    return nil
  else win_combo = won?(board) 
    board[win_combo[0]]
  end
end