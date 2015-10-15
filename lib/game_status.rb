# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
    winningcombo = [board[wincombo[0]],board[wincombo[1]],board[wincombo[2]]]
    xcombo = winningcombo.all? {|position| position == "X"} #are X's in all the winning combo places?
    ocombo = winningcombo.all? {|position| position == "O"}
    return wincombo if xcombo || ocombo
  end #each_end
  false
end #method_end

#     wincombo1 = wincombo[0] #the index of a winning position
#     wincombo2 = wincombo[1]
#     wincombo3 = wincombo[2]
#     position1 = board[wincombo1] #the move "X" or "O" or " "
#     position2 = board[wincombo2]
#     position3 = board[wincombo3]
#     if position1 == "X" && position2 == "X" && position3 == "X"
#       return wincombo
#     elsif position1 == "O" && position2 == "O" && position3 == "O"
#       return wincombo
#     else
#       return false
#     end #if_end


def full?(board)
  if board.any? {|x| x == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board) || !full?(board)
    false
  else
    true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  wincombo = won?(board) #original winning array
  if wincombo
    return board[wincombo[0]]
  end
end