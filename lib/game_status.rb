# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |winning_combination|
    (winning_combination.all?{|position| board[position] == "X"}) || (winning_combination.all?{|position| board[position] == "O"})
  end
end

def full?(board)
  !(board.include?(" ") || board.include?(nil) || board.include?(""))
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    winning_array = won?(board)
    return board[winning_array[0]] 
  else
    return nil
  end
end



