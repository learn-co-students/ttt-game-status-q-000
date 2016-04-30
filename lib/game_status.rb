# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[ 
   [0,1,2],#0 #top row horizontal
   [3,4,5],#1 #middle row horizontal
   [6,7,8],#2 #buttom row horizontal
   
   [0,3,6],#3 #left column verical
   [1,4,7],#4 #middle column verical
   [2,5,8],#5 #right column verical

   [8,4,0],#6 #left_to_right adj
   [2,4,6] #7 #right_to_left adj

]


#----///////------////////------//////-----#



def won?(board)
  WIN_COMBINATIONS.find do |set|
    board[set[0]] == board[set[1]] &&
    board[set[1]] == board[set[2]] &&
    position_taken?(board, set[2])
  end
end 


def draw?(board)
 won?(board).nil? && full?(board)
end


def full?(board)
  (board.include?("X") || board.include?("O")) && 
  !(board.include?(" ") || board.include?(""))
end


def over?(board)
  full?(board) && draw?(board) ||!(won?(board).nil?)
end

def winner(board)
  if won?(board) !=nil
   board[ won?(board)[0] ]
  else
    won?(board)
  end

end

