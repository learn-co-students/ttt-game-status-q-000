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
[6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.find do |combin|
  board[combin[0]] == board[combin[1]] &&
  board[combin[1]] == board[combin[2]] &&
  position_taken?(board, combin[0])
end
  end

def full?(board)
board.all?{|player| player == "X" || player == "O"}  
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
 end
 
def winner(board)
  if winning_combin = won?(board)
    board[winning_combin.first]
    end
   end   