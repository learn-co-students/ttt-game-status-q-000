# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =  [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  #Bottom row
  [0,3,6],  #Left columns
  [1,4,7],  #Center column
  [2,5,8],  #Right column
  [0,4,8],  #Left diagonal
  [2,4,6]  #Right diagonal
]

def won?(board)
  WIN_COMBINATIONS.each { |win_group|
    if (board[win_group[0]] == "X"  && board[win_group[1]] == "X"  && board[win_group[2]] == "X") || (board[win_group[0]] == "O" && board[win_group[1]] == "O" && board[win_group[2]] == "O")
      return win_group
    end
  }
return false
end

def full?(board)
  board.none? {|index| index == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each { |win_group|
    if (board[win_group[0]] == "X"  && board[win_group[1]] == "X"  && board[win_group[2]] == "X") || (board[win_group[0]] == "O" && board[win_group[1]] == "O" && board[win_group[2]] == "O")
      return board[win_group[0][0]]
end
}
       return nil
  end
