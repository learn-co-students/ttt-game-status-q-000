# Helper Method

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  [6, 4, 2]
]

# def won?(board)
#   WIN_COMBINATIONS.each do |win_combo|
#     if win_combo.all? {|index| board[index] == "X" }
#       return win_combo
#     elsif win_combo.all? {|index| board[index] == "O"}
#        return win_combo
#     end
#   end
#   false
# end

# refactored

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    return win_combo if win_combo.all? {|position| board[position] == "X" }
    return win_combo if win_combo.all? {|position| board[position] == "O" }
  end
end

def full?(board)
  board.all? {|position| position != " " }
end

def draw?(board)
  full?(board)
  !won?(board)
end

def over?(board)
  return true if won?(board)
  return true if full?(board)
  return false if draw?(board)
end

def winner(board)
 if won?(board)
   board[won?(board).first]
 end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
