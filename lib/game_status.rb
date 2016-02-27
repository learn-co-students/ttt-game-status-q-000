# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row, remember commas after each sub-array
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 4, 8], #diagonal left
  [2, 4, 6], #diagonal right
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8] #right column
  ]

matches = []

def won?(board)
  if full?(board)
    return false
  else

    matches = WIN_COMBINATIONS.select do |combo|

       winning = combo.all? do |space|
          board[space]=="X" || board[space]=="O" #needed to change it to just board[space]. Also needed to remove the "if" I had here, because "all?" already checks for truth
        end #end of combo.all? and the "winning" declaration

    end #end of WIN_COMBINATONS.each
  def winner(board)
    return matches[0][0]
  end
  return matches[0]
  end #end of overarching if statement
end

def full?(board)
    board.all? do |space|
      space=="X" || space=="O"
    end
end

def draw?(board)
  if !won?(board) && full?(board)
      return true
    else
      return false
  end
end


won?(board)