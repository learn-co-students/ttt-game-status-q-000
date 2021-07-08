# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
#juine your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
 ]
 def won?(board)
   WIN_COMBINATIONS.each do |win|
     win_index_1 = win[0]
     win_index_2 = win[1]
     win_index_3 = win[2]

     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 ==  "O" && position_3 == "O")
        return win
      end
    end
    false
  end





def full?(board)
  board.each do |ind|
    if ind ==  " " || ind == nil
      return false
    end
  end
  true
end



def draw?(board)
  if (!won?(board)) && full?(board)
    return true
  end
end



def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
     board[won?(board)[0]]
   end
 end

board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
winner(board)

board = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
winner(board)
