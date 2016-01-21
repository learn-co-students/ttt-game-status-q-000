# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #l-top r-bottom
  [2,4,6], #r-top l-bottom
  [0,3,6], #left col
  [1,4,7], #mid col
  [2,5,8] #right col
]

def won?(board)
  WIN_COMBINATIONS.each do |wincombination|
    win_index_1 = wincombination[0]
    win_index_2 = wincombination[1]
    win_index_3 = wincombination[2]

    position_1=board[win_index_1]
    position_2=board[win_index_2]
    position_3=board[win_index_3]

    if (position_1=="X" && position_2=="X" && position_3=="X")||(position_1=="O" && position_2=="O" && position_3=="O")
       return [win_index_1,win_index_2,win_index_3]
    end
  end
  false
end

def full?(board)
  board.each do |cell|
    if (cell==" ")
      return false
    end
  end
  true
end

def draw?(board)
  if (full?(board)&&!won?(board))
    true
  else
    false
  end
end

def over?(board)
  if (draw?(board)||won?(board) )
    true
  else
    false
  end
end

def winner(board)
  if draw?(board)
    nil
  elsif won?(board)
    win=won?(board)
    board[win[0]]
  end
end