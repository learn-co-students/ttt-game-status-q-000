# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.any? do |combo|
    if combo.all? {|spot| position_taken?(board, spot)}
      if combo.all? {|spot| board[spot] == "X"}
        return combo
      elsif combo.all? {|spot| board[spot] == "O"}
        return combo
      end
    end
  end
end

def full?(board)
  board.all? {|spot| spot == "X" || spot == "O"}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == true
    false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board) == false
    return nil
  elsif won?(board).all? {|spot| board[spot] == "X"}
    return "X"
  elsif won?(board).all? {|spot| board[spot] == "O"}
    return "O"
  end
end