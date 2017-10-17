# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left row
    [1,4,7], #middle row
    [2,5,8], #right row
    [0,4,8], #cross row
    [6,4,2] #cross row
  ]
def won?(board)
  #require 'pry'
  # binding.pry
    WIN_COMBINATIONS.each do |position|
      if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
          return position
      elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
          return position
      end
    end
    false
end


def full?(board)
  !board.any?{|field| field == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |position|
    if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
        return "X"
    elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
        return "O"
    end
  end
  nil
end
