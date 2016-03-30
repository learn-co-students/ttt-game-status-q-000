
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
[6,4,2]
]

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|


  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]  

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false 
    end
  end 
  exit = false
  exit
end



def full?(board)
  board.none?{|j| j == " "}
end

def draw?(board)
  if won?(board) != false
    false
  elsif board.none?{|k| k == " "}
    true
  end
end  

def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) == true
    true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|


  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]  

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    else
      nil 
    end
  end 
  exit = nil
  exit
end


