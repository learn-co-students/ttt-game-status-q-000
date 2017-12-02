# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal 1
  [2,4,6], # Diagonal 2
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    index_1 = combination[0]
    index_2 = combination[1]
    index_3 = combination[2]

    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]
    #puts "Board: #{board[index_1]}, #{board[index_2]}, #{board[index_3]}"
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combination
    end
  end
  return false
end

def full?(board)
  !board.any?{ |i| i == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
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
  won_location = won?(board)
  puts "Won: #{won_location}"
  if won_location == false
    return nil
  else
    return board[won_location[0]]
  end
end

