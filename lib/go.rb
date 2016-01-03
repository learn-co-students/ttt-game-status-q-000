#### DAVID'S Solution


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
[0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal
[0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical
[0, 4, 8], [2, 4, 6] #Diagonal
]


 
def board_empty?(board)
  empty = !board.any? do |pos|
    pos == "X" || pos == "O"
  end
  return empty
end
# End Helper Methods

def won?(board)
  if board_empty?(board)
    return false
  end

  WIN_COMBINATIONS.each do |combo|
    winning_combination = [board[combo[0]], board[combo[1]], board[combo[2]]]
    #puts "#{winning_combination}"
    if winning_combination.all? {|char| char=="X"} || winning_combination.all? {|char| char == "O"}
      #puts "#{combo} is a winning combination"
      return combo
    end
  end
  return false
end

won?(board)
#if new_array.all? {|x| x == "X"} or new_array.all? {|o| o == "O"}