def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end


def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------" 
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------" 
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5], 
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],  
  [2,4,6], 
  [0,4,8]]


def won?(board)
  if board[WIN_COMBINATIONS[0][0]] == "X" && board[WIN_COMBINATIONS[0][1]] == "X" && board[WIN_COMBINATIONS[0][2]] == "X"
  return [0,1,2]
elsif board[WIN_COMBINATIONS[0][0]] == "O" && board[WIN_COMBINATIONS[0][1]] == "O" && board[WIN_COMBINATIONS[0][2]] == "O"
  return [0,1,2]
  elsif board[WIN_COMBINATIONS[1][0]] == "X" && board[WIN_COMBINATIONS[1][1]] == "X" && board[WIN_COMBINATIONS[1][2]] == "X"
  return [3,4,5]
elsif board[WIN_COMBINATIONS[1][0]] == "O" && board[WIN_COMBINATIONS[1][1]] == "O" && board[WIN_COMBINATIONS[1][2]] == "O"
  return [3,4,5]
  elsif board[WIN_COMBINATIONS[2][0]] == "X" && board[WIN_COMBINATIONS[2][1]] == "X" && board[WIN_COMBINATIONS[2][2]] == "X"
  return [6,7,8]
elsif board[WIN_COMBINATIONS[2][0]] == "O" && board[WIN_COMBINATIONS[2][1]] == "O" && board[WIN_COMBINATIONS[2][2]] == "O"
  return [6,7,8]
  elsif board[WIN_COMBINATIONS[3][0]] == "X" && board[WIN_COMBINATIONS[3][1]] == "X" && board[WIN_COMBINATIONS[3][2]] == "X"
  return [0,3,6]
   elsif board[WIN_COMBINATIONS[3][0]] == "O" && board[WIN_COMBINATIONS[3][1]] == "O" && board[WIN_COMBINATIONS[3][2]] == "O"
  return [0,3,6]
  elsif board[WIN_COMBINATIONS[4][0]] == "X" && board[WIN_COMBINATIONS[4][1]] == "X" && board[WIN_COMBINATIONS[4][2]] == "X"
  return [1,4,7]
   elsif board[WIN_COMBINATIONS[4][0]] == "O" && board[WIN_COMBINATIONS[4][1]] == "O" && board[WIN_COMBINATIONS[4][2]] == "O"
  return [1,4,7]
  elsif board[WIN_COMBINATIONS[5][0]] == "X" && board[WIN_COMBINATIONS[5][1]] == "X" && board[WIN_COMBINATIONS[5][2]] == "X"
  return [2,5,8]
elsif board[WIN_COMBINATIONS[5][0]] == "O" && board[WIN_COMBINATIONS[5][1]] == "O" && board[WIN_COMBINATIONS[5][2]] == "O"
  return [2,5,8]
  elsif board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X"
  return [2,4,6]
   elsif board[WIN_COMBINATIONS[6][0]] == "O" && board[WIN_COMBINATIONS[6][1]] == "O" && board[WIN_COMBINATIONS[6][2]] == "O"
  return [2,4,6]
  elsif board[WIN_COMBINATIONS[7][0]] == "X" && board[WIN_COMBINATIONS[7][1]] == "X" && board[WIN_COMBINATIONS[7][2]] == "X"
  return [0,4,8]
   elsif board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O"
  return [0,4,8]
elsif board 
  else false
end
end

def full?(board)
board.all?{|character| character == "X" || character == "O"}

end


def draw?(board)
  !won?(board) && full?(board) 
end 

def over?(board)

won?(board) || draw?(board) || full?(board)

end


def winner(board)
if the_index_win = won?(board)
  board[the_index_win.first]
  end
end
