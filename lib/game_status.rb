board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS =[
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
  won = false
  WIN_COMBINATIONS.each {|win_combination|
    all_X = win_combination.all? {|win_index| board[win_index] == "X"}
    all_O = win_combination.all? {|win_index| board[win_index] == "O"}
    if all_X == true || all_O == true
      won = win_combination
  end}
  return won
end
      

def full?(board)
  empty = board.include?(" ")
  if empty == true
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  elsif won?(board) == false 
  false
elsif board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  false
end
end



def over?(board)
  if won?(board) != false
    true
  elsif draw?(board) == true
    true
  else
    false
  end
  end

def winner(board)
if won?(board) != false
    if won?(board).all? {|i| board[i] == "X"}
      return "X"
    elsif won?(board).all? {|i| board[i] == "O"}
      return "O"
    end
  end
end



