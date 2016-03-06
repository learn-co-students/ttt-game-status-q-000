# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |subarray|
    if board[subarray[0]] == "X" && board[subarray[1]] == "X" && board[subarray[2]] == "X"
      #puts "X is the winner"
      return subarray
    end

    if board[subarray[0]] == "O" && board[subarray[1]] == "O" && board[subarray[2]] == "O"
     # puts "O is the winner"
     return subarray
    end
  end
  return nil
end

def full?(board)
    board.each do |element|
      if element == "" || element == " "
        return false
      end
    end
    return true
end

def draw?(board)
   if full?(board) && !won?(board)
     return true
   end
   return false
end

def over?(board)
   if full?(board) || won?(board) || draw?(board)
     return true
   end
   return false
end

def winner?(board)
  WIN_COMBINATIONS.each do |subarray|
    if board[subarray[0]] == "X" && board[subarray[1]] == "X" && board[subarray[2]] == "X"
      #puts "X is the winner"
      return "X"
    end

    if board[subarray[0]] == "O" && board[subarray[1]] == "O" && board[subarray[2]] == "O"
     # puts "O is the winner"
      return "O"
    end
  end
  return nil
end

def x_and_o?(board,subarray)
   xs=" "
   os=" "
  subarray.each do |element|
    if board[element] == "X"
      xs="Y"
    elsif board[element] == "O"
      os="Y"
    end
  end
  if xs =="Y" && os=="Y"
    return true
  end
  return false
end

def cats_game?(board)
  WIN_COMBINATIONS.each do |subarray|
    if !x_and_o?(board,subarray)
       return false
    end
  end
  return true
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
]

board = ["O", "X", "O"," ","O"," "," "," ","O"]
board = ["X", "O", "X", "O", "O", "X", "X", "X", "O"]

puts winner?(board)
puts won?(board)
puts cats_game?(board)
