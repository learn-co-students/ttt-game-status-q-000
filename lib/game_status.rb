# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
[0,1,2], #Top Row
[3,4,5], #Middle Row
[6,7,8], #Bottom Row
[0,3,6], #left vert
[1,4,7], #middle vert
[2,5,8], #Right Vert
[0,4,8], #TL to RB diag
[2,4,6] #TR to BL diag
]
def won?(board)
  
  combo_holder=-1
  WIN_COMBINATIONS.detect do |combos|
     combo_holder+=1
     if board[combos[0]]=="X" && board[combos[1]]=="X" && board[combos[2]]=="X"
        return WIN_COMBINATIONS[combo_holder]
      elsif board[combos[0]]=="O" && board[combos[1]]=="O" && board[combos[2]]=="O"
        return WIN_COMBINATIONS[combo_holder]
      else
         false
      end
  end
end
ARRAY=[0,1,2,3,4,5,6,7,8]
def full?(board)
  ARRAY.all? do |board_pos|
    position_taken?(board,board_pos)
  end
end

def draw?(board)
  win_ox=won?(board)
  if win_ox.instance_of? Array
    return false
  elsif full?(board)==true
    return true
  else
    return false
   end
end

def over?(board)
  over_xo= won?(board)
  if over_xo.instance_of? Array 
    return true
  elsif draw?(board)==true
    return true
  else
    return false
  end
end

def winner(board)
    win_xo=won?(board)
    if win_xo.instance_of? Array
      if board[win_xo[1]]== "X"
        return "X"
      elsif board[win_xo[1]]== "O"
        return "O"
     end
   else
    nil
   end
end
 