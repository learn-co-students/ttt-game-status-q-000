# Helper Method

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def position_taken?(board, location)
    !(board[location].nil? || board[location] == " ")
  end

WIN_COMBINATIONS = [  [0,1,2],  [3,4,5],  [6,7,8],  [0,3,6],  [1,4,7],  [2,5,8],  [0,4,8],  [2,4,6]  ]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |full|
    full == "X" || full == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board).nil?
    true
  elsif full?(board) == true && won?(board) == true
    false
  elsif full?(board) == false && won?(board) == false
    false
  end
end

def over?(board)
  if draw?(board) == true
    true
  elsif !won?(board).nil?
    true
  elsif full?(board) == false
    false
  end
end

def winner(board)
  puts won?(board)
  puts "test1"
  if !won?(board).nil?
    puts board[won?(board)[0]]
    puts "test"
    board[won?(board)[0]]
  end
end
won?(board)
full?(board)
draw?(board)
over?(board)
winner(board)
# puts won?(board)