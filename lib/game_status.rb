# Helper Method

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
    combo_chars = [board[combo[0]], board[combo[1]], board[combo[2]]]
    #puts "#{combo_chars}"
    if combo_chars.all? {|char| char=="X"} || combo_chars.all? {|char| char == "O"}
      #puts "#{combo} is a winning combination"
      return combo
    end
  end
  return false
end


def board_not_full?(board)
  not_full = !board.any? do |pos|
    pos == " "
  end
  return false
end


def full?(board)
  board.none?{|i| i == " " }
end


def draw?(board)
  if full?(board) == true and won?(board) == false
    return true
  end
  if board.none? {|p| p == WIN_COMBINATIONS }
    return false
  end
end


def over?(board)
  board.none? {|e| e == " " }
end


def winner(board)
  if won?(board) == false
    return nil
  end

  WIN_COMBINATIONS.each do |combo|
    combo_chars = [board[combo[0]], board[combo[1]], board[combo[2]]]
    #puts "#{combo_chars}"
    if combo_chars.all? {|char| char=="X" }
      #puts "#{combo} is a winning combination"
      return "X"
    end

    if combo_chars.all? {|char| char == "O" }
      return "O"
    end
  end
end







