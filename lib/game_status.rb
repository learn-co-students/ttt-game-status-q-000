# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return win_combination
    end

      if  (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end





   end

   return false
  end

  def full?(board)
    board.each {|b| return false if b == " "}

    return true


  end


  def draw?(board)
    if (!won?(board) && full?(board))

      return true
    else
      return false
   end


  end

  def over?(board)
 if (won?(board) || full?(board) || draw?(board))
   return true
else
  return false
end
 end

 def turn_count(board)
 count = 0
  board.each do |b|
    if (b == "X" || b == "O" )
      count += 1
   end
  end
  return count
 end


 def current_player(board)
   if (turn_count(board) % 2 == 0)
     return "O"
   else
     return "X"
   end
 end



def winner(board)
  if (won?(board))
    a = won?(board)
    return board[a[0]]
  else
    return nil
  end


end
