# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if win.all? {|e| board[e] == 'X'}
      return win 
    elsif win.all? {|e| board[e] == 'O'}
      return win
    end
  end
    if board.all? { |position| position != " "}
      false
    elsif board.all? { |position| position == " "}
      false 
    end
end
def full?(board) 
  if board.none? {|position| position == " "}
     true
  end
end

def draw?(board)
  unless won?(board)
     true 
  end
end

def over?(board) 
  unless won?(board) || full?(board)
    return false
  end
  return true
end

def winner(board)
  unless won?(board)
    return nil
  end
  if board[won?(board)[0]] == 'X'
    return 'X'  
  elsif board[won?(board)[0]] == 'O'
    return 'O'
  end
end



