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
  WIN_COMBINATIONS.detect do |win|
    position_taken?(board, win[0]) && board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]]
  end
end

def full?(board)
  all_full = board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board)
    false
  else
    false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    won?(board).each do |index|
      if position_taken?(board, index) && board[index] == "X"
        return "X"
      elsif position_taken?(board, index) && board[index] == "O"
        return "O"
      else
        return nil
      end
    end 
  end
end




