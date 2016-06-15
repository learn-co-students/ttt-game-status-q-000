# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # cross1
  [2,4,6] # cross2
]

#pry? use to stop

def won?(board)
  WIN_COMBINATIONS.each do |combo| #combo is like:
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||
      board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      true
    else
      false
    end
  end
end

#def full?(board)
#  !board.all? { |pos| !pos.strip.empty? }
#end

def full?(board)
  !board.find.with_index(0) { |pos, index| !position_taken?(board, index)}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  combo_or_nil = won?(board)
  if combo_or_nil
    board[combo_or_nil[0]]
  else
  end
end

def winner(board)
  if combo_or_nil = won?(board)
    board[combo_or_nil[0]]
  end
end
