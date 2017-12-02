# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #Top Row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column
  [2, 5, 8], #Right column
  [0, 4, 8], #Left-to-right descending diagonal
  [2, 4, 6] #Right-to-left descending diagonal
]


#WON? Method
def won?(board)
  WIN_COMBINATIONS.detect do |win_type|  
    position_taken?(board, win_type[0]) &&
    board[win_type[0]] == board[win_type[1]] &&
    board[win_type[1]] == board[win_type[2]] 
  end
end

#full? method

def full?(board)
  board.none?{|full_board| full_board==" "}
end

#draw? method 
def draw?(board)
  if full?(board) == true && won?(board) == nil
    return true
  else
    return false
  end
end

#over? method
def over?(board)
  if full?(board) == true || won?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

#winner? method
def winner(board)
    if won?(board) == nil
      return nil
    else
    return board[won?(board)[0]]
  end
end


