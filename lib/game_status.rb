# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Down-right diagonal
  [2,4,6]   # Down-left diagonal
  ]

def won?(board)
  ["X","O"].each do |token|
    WIN_COMBINATIONS.each do |win_combination|
      @all_same = win_combination.all? do |index|
        board[index] == token
      end
      if @all_same
        return win_combination 
      end
    end
  end
  return @all_same
end

def full?(board)
  board.each_with_index do |pos, i|
    if !position_taken?(board, i)
      return false
    end
  end
end

def draw?(board)
  return !won?(board) && full?(board) ? true : false
end

def over?(board)
  return won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  return won?(board) ? board[won?(board)[0]] : nil
end