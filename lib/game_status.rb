# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end
def won?(board)
  WIN_COMBINATIONS.each do  |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    if (board[win_index_1] == "X" && board[win_index_2]  == "X" && board[win_index_3] == "X")||(board[win_index_1] == "O" && board[win_index_2]  == "O" && board[win_index_3] == "O")
      return win_combination
    end
  end
  false
end
def full?(board)
  board.all? { |e| e != " "  }
end
def over?(board)
  if won?(board) !=false ||draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end
def winner(board)
   if won?(board) != false
     array = won?(board)
     board[array[0]]
   else
     nil
   end
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
