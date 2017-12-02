# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal from left top down
  [6,4,2] #diagonal from right top down
]

def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
    win1 = wincombo[0]
    win2 = wincombo[1]
    win3 = wincombo[2]

    position1 = board[win1]
    position2 = board[win2]
    position3 = board[win3]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return wincombo
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return wincombo
    end
  end
  false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
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
  if won?(board)
    return board[won?(board)[0]]
  end
end
