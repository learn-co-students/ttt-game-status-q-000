
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

def won?(board)
  if board.all? {|position| position == " "}
    
    return false
  elsif WIN_COMBINATIONS.each {|winning_array|
    if winning_array.all? {|position| board[position] == "X" }
      
      return winning_array
    elsif winning_array.all? {|position| board[position] == "O"}
      
      return winning_array
    end
      }
    return false
  end    
end


def full?(board)
  WIN_COMBINATIONS.all? {|winning_array|
    winning_array.all?{|location| position_taken?(board, location)}
  }
end

def draw?(board)
  won?(board) == false && full?(board) == true
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board).to_a[0]]
  end
end



