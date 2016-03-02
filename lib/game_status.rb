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

matches =

def won?(board)

    matches = WIN_COMBINATIONS.select do |combo|

     o_wins = combo.all? do |space|
          board[space]=="O"  #needed to change it to just board[space]. Also needed to remove the "if" I had here, because "all?" already checks for truth
        end #end of combo.all? and the "winning" declaration
      x_wins = combo.all? do |space|
          board[space]=="X"  #needed to change it to just board[space]. Also needed to remove the "if" I had here, because "all?" already checks for truth
        end #end of combo.all? and the "winning" declaration

      o_wins || x_wins # this was the key that allowed me to win
    end #end of WIN_COMBINATONS.each
   final_check = matches.any? do |i|
    i.length>1
   end
  if final_check
    return matches[0]
    else
    return false
  end #end of the return conditional
end # end of the won? method

def full?(board)
    board.all? do |space|
      space=="X" || space=="O"
    end
end

def draw?(board)
  if won?(board)==false && full?(board)
      return true   #if this is returning true for a won game, that means some types of won games are returning false in my #won? method. Which ones and why?
    else
      return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
    else
    return false
  end
end

def winner(board)
  win_index=won?(board) #needed to get an index for pulling out X or O itself, not just the index number. I did that based on the won? method's return value
  if won?(board)
    return board[win_index[0]]
  end
end
