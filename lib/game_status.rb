# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],
                  [0,3,6],
                  [0,4,8],
                  [1,4,7],
                  [2,5,8],
                  [2,4,6],
                  [3,4,5],
                  [6,7,8]]

def x_won?(board,combo)
  combo.all?{|position| board[position]=="X"}
end

def y_won?(board,combo)
  combo.all?{|position| board[position]=="O"}
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    x_won?(board,combo)||y_won?(board,combo)
  end
end

def full?(board)
  board.all? {|element| element=="X"||element=="O"}
end

def draw?(board)
  full?(board)&&!won?(board)
end

def over?(board)
  full?(board)|won?(board)
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]]=="X"
      "X"
    else
      "O"
    end
  end
end