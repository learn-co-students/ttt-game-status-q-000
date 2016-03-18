# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row

  [0,3,6], #Left column
  [1,4,7], #Middle Column
  [2,5,8], #Right column

  [2,4,6], #diagonal one
  [0,4,8] #diagonal two
]
def won?(board)
WIN_COMBINATIONS.each do |winarray|
  win_index_1 = winarray[0]
  win_index_2 = winarray[1]
  win_index_3 = winarray[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return winarray # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return winarray
  else
    false
  end
end
false
end

def full?(board)
if board.detect{|i| i == " "}; false; else; true; end
end

def draw?(board)
if board.detect{|i| i != " "} && won?(board) == false; true;
  elsif won?(board) == true; false;
  elsif board.detect{|i| i == " "}; false; end
end

def over?(board)
if full?(board) == false; return false; end
 if draw?(board) == true; true;
    elsif won?(board) != false; true;
    end
end

def winner(board)
if draw?(board) == true; nil;
  else

  WIN_COMBINATIONS.each do |winarray|
  win_index_1 = winarray[0]
  win_index_2 = winarray[1]
  win_index_3 = winarray[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O"
  else
    false
  end
end
false

end
end




