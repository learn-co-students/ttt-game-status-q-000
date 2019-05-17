require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], 
  [1,4,7], [2,5,8], [0,4,8], [2,4,6]  
]
  
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_pos1 = combo[0]
    win_pos2 = combo[1]
    win_pos3 = combo[2]

    position1 = board[win_pos1]
    position2 = board[win_pos2]
    position3 = board[win_pos3]

    if (
      position1 == "X" && 
      position2 == "X" && 
      position3 == "X"
      ) || (
        position1 == "O" && 
        position2 == "O" && 
        position3 == "O"
      )
      return combo
    end
  end
  return false
end

def full?(board) 
  board.all? { |i| i == "X" || i == "O" }
end

def draw?(board)
  if full?(board)
    if !won?(board)
      return true
    end
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end


