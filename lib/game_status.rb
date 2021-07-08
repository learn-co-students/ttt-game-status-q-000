# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn_count(board)
  #returns number of turns that have been played
  counter = 0
  board.each do |value|
    if value == "X" || value == "O"
      counter += 1
    end
  end
  return counter
end

def three_moves?(board)
  if turn_count(board) >= 3
    true
  else
    false
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Horizontal
  [3,4,5], #Middle Horizontal
  [6,7,8], #Bottom Horizontal
  [0,3,6], #Left Vertical
  [1,4,7], #Middle Vertical
  [2,5,8], #Right Vertical
  [0,4,8], #Top Left -> Bottom Right
  [2,4,6]  #Top Right -> Bottom Left
  ]

def won?(board)
  if three_moves?(board)
    WIN_COMBINATIONS.each do |winning_combo|
      if winning_combo.all?{|i| board[i] == "X"} || winning_combo.all?{|i| board[i] == "O"}
        return winning_combo
      end
    end
    return false
  end
end

def full?(board)
  board.none?{|v| v == " "} && board.none?{|v| v == ""} && board.none?{|v| v == nil}
end

def draw?(board)
  won?(board) == false && full?(board) == true
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |winning_combo|
      if winning_combo.all?{|i| board[i] == "X"}
        return "X"
      elsif winning_combo.all?{|i| board[i] == "O"}
        return "O"
      end
    end
  end
end