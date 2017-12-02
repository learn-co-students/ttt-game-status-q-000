# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]

def won?(board)
  location = 0
  count = 0 
  while location < 9
    if position_taken?(board, location) == false
      count += 1
    end
    location += 1
  end
  if count == 9 
    return false
  end
count = 0
WIN_COMBINATIONS.each do |combination|
     if ( board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X") || (board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O")
       return combination # return the win_combination indexes that won.
     else
       count += 1
     end
     if count == 8 
      return false
    end
  end
end

def full?(board)
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
     count += 1
    end
  end
  if count == 9 
    return true
  else 
    return false
  end
end

def draw?(board)
  if won?(board) == true
    return false
  elsif won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  end
end

def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) == true
    return true
  end
end

def winner(board)
  if  won?(board) != false
    array = won?(board)
       all_X = array.all? do |locatie|
       board[locatie] == "X" 
        end
   if all_X == true     
    return "X"
   elsif  all_O = array.all? do |locatie|
    board[locatie] == "O"
           end
        if all_O == true
          return "O"
        end
    end    
  end
end




