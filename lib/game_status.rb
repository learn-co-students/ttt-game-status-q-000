# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # bottom row
  [0,4,8], # diagonal
  [2,4,6], # diagonal
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  if board.all?{|i| i==" "} == true
    return false
  else
    counter = 0
    WIN_COMBINATIONS.each do |win_combination|
      puts "check start"
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3
      counter += 1
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indices that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the win_combination indices that won.
      elsif counter == WIN_COMBINATIONS.length
        return false
      elsif position_taken?(board,win_index_1) == false || position_taken?(board,win_index_2) == false || position_taken?(board,win_index_3) == false
        false
      else
        false
      end
    end
  end
end

def full?(board)
  return board.none?{|i| i==" "}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) == true || won?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  token = won?(board)
  puts token
  puts token == false
  if token == false
    return nil
  else
    puts token
    puts "yay"
    puts board[token[0]]
    return board[token[0]]
  end
end

board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
token2 = winner(board)
if token2 == nil
  puts "yay nil"
else
  puts "boo"
end
