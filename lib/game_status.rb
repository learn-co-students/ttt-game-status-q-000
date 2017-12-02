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
  [0,4,8], # Top-left to bottom-right diagonal
  [6,4,2]  # Top-right to bottom-left diagonal
    ]

def won?(board)
  result = false
  WIN_COMBINATIONS.each do |win_combination|
    if !result
      if win_combination.all?{|i| board[i]=="X"} || win_combination.all?{|i| board[i]=="O"}
         result = win_combination
      end
    end
  end
   result
end

def full?(board)
  if board.any?{|location| location == " "}
     false
    else
      true
    end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
   false
  end
end

def over?(board)
  if won?(board) == false && draw?(board) == false && full?(board) == false
    false
  else
    true
  end
end

def winner(board)
  win_combination = won?(board)
    if win_combination
      board[win_combination[0]]
    else
      nil
    end
end
