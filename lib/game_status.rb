# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]



def won?(board)
  win=[]
  WIN_COMBINATIONS.each do |x|
    if board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X"
      then win = [x[0], x[1], x[2]]
      return win
    elsif board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"
      then win = [x[0], x[1], x[2]]
      return win
    end
  end
  false
  #can do this because return automatically interrupts the method...so the method shouldn't reach "false" unless neither the if nor the elsif conditions are satisfied.
  #on top of that, .each returns the array its working on, automatically, so you have to interrupt it OR have it return the variable outside of itself, which seemed sort of annoying
end

def full?(board)
  if board.detect{|x| x == " "} != " "
    then true
  elsif board.detect{|x| x == " "} == " "
    then false
  end
end

def draw?(board)
  if won?(board) != false && full?(board) == true
    then false
  elsif won?(board) == false && full?(board) == true
    then true
  end
end

def over?(board)
  if full?(board) == true
    then true
  elsif draw?(board) == true
    then true
  else
    false
  end
end

#tricky tricky, making us change the method name here to fit spec
def winner(board)
    win=[]
  WIN_COMBINATIONS.each do |x|
    if board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X"
      then win = [x[0], x[1], x[2]]
      return "X"
    elsif board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"
      then win = [x[0], x[1], x[2]]
      return "O"
    end
  end
  nil
end

