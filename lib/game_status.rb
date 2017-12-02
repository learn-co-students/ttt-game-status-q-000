# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    combo_1 = board[combo[0]]
    combo_2 = board[combo[1]]
    combo_3 = board[combo[2]]
    return combo if combo_1 == "X" && combo_2 == "X" && combo_3 == "X"
    return combo if combo_1 == "O" && combo_2 == "O" && combo_3 == "O"
  end
  false
end

def full?(board)
  board.include?(" ") ? false : true
end

def draw?(board)
  if !(won?(board)) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if combo = won?(board)
    board[combo[0]]
  end
end