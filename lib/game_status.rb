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
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
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
