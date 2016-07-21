

def draw?(board)
  draw=nil
  if full?(board)==true && won?(board)==nil
    draw=true
  end
  draw
end
def over?(board)
  over=nil
  if full?(board)==true || won?(board)==true
    over=true
  end
end
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def full?(board)
  full=nil
  full=[0,1,2,3,4,5,6,7,8].all? do |spot|
    position_taken?(board, spot)
  end
  full
end
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
def won?(board)
  winners=nil
  WIN_COMBINATIONS.each do |winco|
    if board[winco[0]]==board[winco[1]] && board[winco[1]]==board[winco[2]] && board[winco[2]]!=" " && board[winco[2]]!=""
      winners= winco
    end
  end
  winners
end

def winner(board)
  winner=nil
  WIN_COMBINATIONS.each do |winco|
    if board[winco[0]]==board[winco[1]] && board[winco[1]]==board[winco[2]] && board[winco[2]]!=" " && board[winco[2]]!=""
      winner=board[winco[0]]
    end
  end
  winner
end
board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
