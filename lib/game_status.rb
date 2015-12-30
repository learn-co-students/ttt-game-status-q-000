# Helper Methods
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

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
    combo_chars = [board[combo[0]], board[combo[1]], board[combo[2]]]
    #puts "#{combo_chars}"
    if combo_chars.all? {|char| char=="X"} || combo_chars.all? {|char| char == "O"}
      #puts "#{combo} is a winning combination"
      return combo
    end
  end
  return false
end

def full?(board)
  return board.all? {|char| char == "X" || char == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  return false
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  winning_combo = won?(board)
  if !winning_combo
    return nil
  else
    return board[winning_combo[0]]
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], #Diagonol from Top Left
    [2,4,6]  #Diagonol from Top Right
  ]
#top_win = ["", "", "", "O", " ", " ", "O", "O", "O"]
#won?(top_win)