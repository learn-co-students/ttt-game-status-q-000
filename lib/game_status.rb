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
  [6,4,2]
]

def won?(board)
  result = false
  WIN_COMBINATIONS.each do |combinations|
    win_index_1 = combinations[0]
    win_index_2 = combinations[1]
    win_index_3 = combinations[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if result == false
      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      result = combinations
      else
        result = false
      end
    end
  end
  result
end

def full?(board)
  board.all?{|elements| !(elements == " " || elements == nil)}
end

def draw?(board)
  return true if (won?(board) == false && full?(board) == true)
  return false if (won?(board) != false || full?(board) == false )
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winning_location = won?(board)
  if winning_location
    board[winning_location[0]]
  else return nil
  end
end