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
  [2,5,8], #last column
  [0,4,8], #left to right diagonal
  [2,4,6]  #right to left diagonal
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    if position_1 == "X" && position_2 =="X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 =="O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  !board.any?{|position| position == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  win_index = won?(board)
  if win_index
    board[win_index[0]]
  end
end
