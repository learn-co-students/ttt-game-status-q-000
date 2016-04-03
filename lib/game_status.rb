# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end


WIN_COMBINATIONS = [
[0, 1, 2], 
[3, 4, 5],
[6, 7, 8], 
[0, 3, 6], 
[1, 4, 7], 
[2, 5, 8],
[0, 4, 8], 
[2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
     if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ||
        board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
     return win_combo
     end
   end
  nil
end

def full?(board)
    board.all? do |filled|
    filled == "X" || filled == "O"   
    end
  end

 def draw?(board)
     !board.any? do |status| 
      status == full?(board) && status == won?(board) ||
     !status == !won?(board)
   end
 end


  def over?(board)
  won?(board) || full?(board)
 end

def winner(board)
  if win_com = won?(board)
  board[win_com[0]]
  end
end
