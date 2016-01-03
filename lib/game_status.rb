# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
    count = 0
    WIN_COMBINATIONS.each do |combi|
    if (board[combi[0]] == "X" && board[combi[1]] == "X" && board[combi[2]] == "X" ||
    board[combi[0]] == "O" && board[combi[1]] == "O" && board[combi[2]] == "O")
      puts "#{combi} is a winning combination"
      return combi
    else
      count += 1
      if count == 8
        return false
      end
    end
  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #mid column
  [2, 5, 8], #right column
  [0, 4, 8], #diagonal down
  [6, 4, 2]] #diagonal up

def full?(board)
  board.each do |pos|
    if pos != " "
      next
      return true
    else
      return false
    end
  end
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if (full?(board)) || (draw?(board)) || (won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
  end
end










