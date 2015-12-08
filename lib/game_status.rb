# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[6,4,2],[0,3,6],[2,5,8],[1,4,7]]

def won?(board)
  WIN_COMBINATIONS.detect do |win_com|
    board[win_com[0]] == board[win_com[1]] &&
    board[win_com[1]] == board[win_com[2]] &&
    position_taken?(board, win_com[0])
  end
end
#   WIN_COMBINATIONS.each do |c|
#     pos_win1 = c[0]
#     pos_win2 = c[1]
#     pos_win3 = c[2]

#     position1 = board[pos_win1]
#     position2 = board[pos_win2]
#     position3 = board[pos_win3]

#     if (position1 == "O" && position2 == "O" && position3 == "O") || (position1 == "X" && position2 == "X" && position3 == "X")
#       return c
#     end
#   end
#   return false
# end

def full?(board)
  !board.any?{ |f| f == " " || f == "" || f.nil? }
end

def draw?(board)
   if full?(board)
     if !won?(board)
       return true
     else
       return false
     end
   elsif
     !won?(board)
     return false
   else return false
   end
end

def over?(board)
  if !draw?(board)
    if !won?(board)
      return false
    else return true
    end
  else return true
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end









