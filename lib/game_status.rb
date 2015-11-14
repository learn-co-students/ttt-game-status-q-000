# Helper Method
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
    [2,4,6]
  ]

#board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
  win = WIN_COMBINATIONS.find do |win_combination|
    board[win_combination[0]] == "X" && 
    board[win_combination[1]] == "X" && 
    board[win_combination[2]] == "X" ||
    board[win_combination[0]] == "O" &&
    board[win_combination[1]] == "O" &&
    board[win_combination[2]] == "O"
  end
  if win 
    win
  else
    false
  end
end


def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  elsif won?(board) == false && full?(board) == false
    false
  elsif won?(board) == true
    false
  end
end

def over?(board)
  #accepts board and is true if won, full, or draw is true
  if won?(board) == true || 
    full?(board) == true || 
    draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    WIN_COMBINATIONS.each do |win_combination|
      if board[win_combination[0]] == "X" && 
        board[win_combination[1]] == "X" &&
        board[win_combination[2]] == "X" 
        return "X"
      elsif board[win_combination[0]] == "O" && 
        board[win_combination[1]] == "O" &&
        board[win_combination[2]] == "O" 
        return "O"
      end
    end
  else
    nil
  end
end
