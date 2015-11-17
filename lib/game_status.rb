
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
   WIN_COMBINATIONS.find do |win_index|
   return win_index if win_index.all? do |position| board[position] == "X" end
   return win_index if win_index.all? do |position| board[position] == "O" end
  end
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  full?(board)
  !(won?(board))
end

def over?(board)
  won?(board)
  full?(board)
end

def winner(board)
  if won?(board)
  win = won?(board)
  return "X" if win.all? do |win_x| board[win_x] == "X" end
  return "O" if win.all? do |win_o| board[win_o] == "O" end
  end
end






WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
  ]