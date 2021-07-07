# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
[0, 1, 2], 
[3, 4, 5], 
[6, 7, 8], 
[0, 3, 6], 
[1, 4, 7], 
[2, 5, 8], 
[0, 4, 8], 
[2, 4, 6]
]


def won?(board)
  win_index_1 = 0
  win_index_2 = 0
  win_index_3 = 0
  position_1 = 0
  position_2 = 0
  position_3 = 0
  WIN_COMBINATIONS.each do |x|
    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return x
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return x
    end
  end
  false
end


def full?(board)
  if board.include?(" ") == true
    false
  else
    true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  elsif won?(board) == false && full?(board) == false
    false
  elsif won?(board) != false
    false
  end      
end

def over?(board)
  if won?(board) != false
    true
  elsif draw?(board) == true
    true
  elsif full?(board) == true
    true
  else
    false
  end
end

def winner(board)
  winner = won?(board)
  if won?(board) == false
  else
    #return x or o
    board[won?(board)[0]]
  end
end





